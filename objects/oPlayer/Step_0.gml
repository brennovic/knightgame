// Configuração da dead zone
var dead_zone = .4;  // Ajuste este valor conforme necessário (0.1 a 0.3 é comum)

// Configuração dos eixos para o controle (movimento nos eixos analógicos do joystick)
xMove = gamepad_axis_value(0, gp_axislh);  // Eixo horizontal do joystick esquerdo
yMove = gamepad_axis_value(0, gp_axislv);  // Eixo vertical do joystick esquerdo

// Aplicando a dead zone
if (abs(xMove) < dead_zone) xMove = 0;
if (abs(yMove) < dead_zone) yMove = 0;

// Movimento de teclado (alternativa caso o controle não esteja conectado)
if (xMove == 0 && yMove == 0) {
    xMove = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    yMove = keyboard_check(ord("S")) - keyboard_check(ord("W"));
}

// Normaliza o vetor de movimento para uma velocidade constante
var move_length = point_distance(0, 0, xMove, yMove);
if (move_length > 0) {
    xMove /= move_length;
    yMove /= move_length;
}

// Lógica para deslizar (slide)
if (is_sliding) {
    sprite_index = slide_sprite;
    slide_speed *= slide_friction;
    var new_x = x + xMove * slide_speed;
    var new_y = y + yMove * slide_speed;

    if (!place_meeting(new_x, y, obj_wall)) {
        x = new_x;
    }
    if (!place_meeting(x, new_y, obj_wall)) {
        y = new_y;
    }

    if (xMove != 0 || yMove != 0) {
        image_angle = point_direction(0, 0, xMove, yMove);
        image_xscale = 1;
        image_yscale = (image_angle > 90 && image_angle < 270) ? -1 : 1;
    }

    if (slide_speed < 0.9) {
        is_sliding = false;
        slide_speed = 3;
        sprite_index = idle_sprite;
        image_angle = 0;
        image_yscale = 1;
    }
} else {
    var new_x = x + xMove * spd;
    var new_y = y + yMove * spd;

    if (!place_meeting(new_x, y, obj_wall)) {
        x = new_x;
    }
    if (!place_meeting(x, new_y, obj_wall)) {
        y = new_y;
    }

    if (xMove != 0 || yMove != 0) {
        sprite_index = run_sprite;
    } else {
        sprite_index = idle_sprite;
    }

    if (xMove != 0) {
        image_xscale = sign(xMove);
    }
}

// Atualiza o cooldown do slide
if (dash_cooldown_timer > 0) {
    dash_cooldown_timer -= 1;
}

// Ativa o slide com o botão do controle ou a tecla de espaço
if ((keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1)) && !is_sliding && dash_cooldown_timer <= 0) {
    is_sliding = true;
    dash_cooldown_timer = dash_cooldown;
    slide_speed = 8;
    audio_play_sound(dash_som, 1, false);
}

// Atualiza a posição do emissor para a posição dos "pés" do personagem
part_emitter_region(part_sistema, emissor, x - 4, x + 4, y + altura_do_personagem, y + altura_do_personagem, ps_shape_ellipse, ps_distr_gaussian);

if (xMove != 0 || yMove != 0) {
    part_emitter_burst(part_sistema, emissor, part_tipo, 1);
}



// No evento Step do objeto oPlayer
if (timer_active) {
    // Incrementa o tempo decorrido em segundos
   time_elapsed += delta_time / 1000000;

    // A cada segundo completo, subtrai a penalidade da pontuação
    if (floor(time_elapsed) > floor(time_elapsed - delta_time / 1000000)) {
        score -= time_penalty;
    }

    // Garante que a pontuação não fique abaixo de zero
    if (score < 0) {
        score = 0;
    }
}



if (dialogo_ativo && mouse_check_button_pressed(mb_right)) {
    indice_dialogo += 1; // Avança para a próxima mensagem

    // Verifica se todas as mensagens foram exibidas
    if (indice_dialogo >= array_length(mensagens_dialogo)) {
        dialogo_ativo = false; // Fecha o diálogo se todas as mensagens foram mostradas
    }
}
