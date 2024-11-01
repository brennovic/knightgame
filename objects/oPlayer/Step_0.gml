// Movimento normal (não afeta o slide)
xMove = keyboard_check(ord("D")) - keyboard_check(ord("A"));
yMove = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Normaliza o vetor de movimento para uma velocidade constante
var move_length = point_distance(0, 0, xMove, yMove);
if (move_length > 0) {
    xMove /= move_length;
    yMove /= move_length;
}

// Lógica para deslizar
if (is_sliding) {
    // Muda o sprite para o sprite de slide
    sprite_index = slide_sprite;

    // Aplica a fricção para reduzir gradualmente a velocidade do slide
    slide_speed *= slide_friction;

    // Calcula a nova posição baseada na velocidade do slide
    var new_x = x + xMove * slide_speed;
    var new_y = y + yMove * slide_speed;

    // Move o jogador na direção do slide, verificando apenas colisão com paredes
    if (!place_meeting(new_x, y, obj_wall)) {
        x = new_x;
    }
    if (!place_meeting(x, new_y, obj_wall)) {
        y = new_y;
    }

   

    // Termina o slide quando a velocidade fica baixa
    if (slide_speed < 0.9) {
        is_sliding = false;
        slide_speed = 3;  // Redefine a velocidade para caminhar

        // Retorna ao sprite normal ao finalizar o slide
        sprite_index = idle_sprite;
    }
} else {
    // Movimento normal com colisão com todos os objetos (se não estiver deslizando)
    var new_x = x + xMove * spd;
    var new_y = y + yMove * spd;

    if (!place_meeting(new_x, y, obj_wall)) {
        x = new_x;
    }
    if (!place_meeting(x, new_y, obj_wall)) {
        y = new_y;
    }

    // Define o sprite correto para movimento ou ocioso
    if (xMove != 0 || yMove != 0) {
        sprite_index = run_sprite;
    } else {
        sprite_index = idle_sprite;
    }
}

// Espelha o personagem baseado na direção de movimento
if (xMove != 0) {
    image_xscale = sign(xMove);
}

// Atualiza o cooldown do slide
if (dash_cooldown_timer > 0) {
    dash_cooldown_timer -= 1;
}

// Ativa o slide com a tecla de espaço se o cooldown tiver terminado
if (keyboard_check_pressed(vk_space) && !is_sliding && dash_cooldown_timer <= 0) {
    is_sliding = true;
    dash_cooldown_timer = dash_cooldown;  // Reinicia o cooldown
    slide_speed = 8;  // Define a velocidade inicial do slide
    audio_play_sound(dash_som, 1, false);
}

