// Verifica se o jogador (oPlayer) existe
if (!instance_exists(oPlayer)) {
    // Destrói a arma se o jogador não existir
    instance_destroy();
    exit; // Sai do código para evitar execução desnecessária
}

// Atualiza a posição da arma em relação ao jogador
x = oPlayer.x;
y = oPlayer.y;

// Calcula o ângulo da arma em relação à posição do mouse
image_angle = point_direction(oPlayer.x, oPlayer.y, mouse_x, mouse_y);

// Ajusta a escala vertical para que a arma espelhe corretamente
image_yscale = (image_angle > 90 && image_angle < 270) ? -1 : 1;

var luz_offset = 20; // ajuste conforme necessário

// Controla a taxa de disparo
if (fire_timer > 0) {
    fire_timer -= 1;
}

// Verifica se o botão esquerdo do mouse ou o botão RB do controle está pressionado e se o temporizador de disparo terminou
if ((mouse_check_button(mb_left) || gamepad_button_check(0, gp_shoulderrb)) && fire_timer <= 0) { // Alteração para usar RB também
    // Define a distância à frente da arma onde a bala será criada
    var offset = 10; // Ajuste conforme necessário

    // Calcula a posição exata à frente da arma com base no ângulo da arma
    var bullet_x = x + lengthdir_x(offset, image_angle);
    var bullet_y = y + lengthdir_y(offset, image_angle);

    // Cria a bala na posição calculada
    var bullet = instance_create_layer(bullet_x, bullet_y, "Weapons", Bala); // Ajuste 'Bala' conforme necessário.

    bullet.direction = image_angle; // Usa o ângulo da arma diretamente
    bullet.speed = 10; // Velocidade da bala

    // Cria obj_luz à frente da arma se ainda não existir
    if (!instance_exists(obj_luz_2)) {
        var luz_x = x + lengthdir_x(luz_offset, image_angle);
        var luz_y = y + lengthdir_y(luz_offset, image_angle);
        var luz = instance_create_layer(luz_x, luz_y, "instance", obj_luz_2);
        luz.image_angle = image_angle;  // Define o ângulo da luz para o mesmo da arma
    }

    // Inicia o recuo ao disparar
    recoil_timer = recoil_distance;

    // Toca o som da arma
    audio_play_sound(snd_guun, 1, false);

    // Reinicia o temporizador de disparo
    fire_timer = fire_rate; 
    
    if (effect_instance == noone) {
        effect_instance = instance_create_layer(x, y, "gunfront", obj_luz_2); // Cria o efeito em cima da arma
        effect_instance.depth = -1; // Ajusta a profundidade para que fique visível sobre a arma
    }
}

// Verifica o estado de atirar (pressionando botão esquerdo do mouse ou RB)
if (mouse_check_button(mb_left) || gamepad_button_check(0, gp_shoulderrb)) {
    atirando = true;
} else {
    atirando = false;

    if (instance_exists(obj_luz_2)) {
        with (obj_luz_2)
            instance_destroy();
    }
}

// Troca o sprite com base no estado de disparo
if (atirando) {
    sprite_index = mac_full_size_1;
} else {
    sprite_index = mac_full_size;
}

// Atualiza a posição e ângulo de obj_luz enquanto está atirando
if (atirando && instance_exists(obj_luz_2)) {
    obj_luz_2.x = x + lengthdir_x(luz_offset, image_angle);
    obj_luz_2.y = y + lengthdir_y(luz_offset, image_angle);
    obj_luz_2.image_angle = image_angle; 

    // Controle de piscada
    blink_timer -= 1;
    if (blink_timer <= 0) {
        blink_timer = 5; // Reinicia o temporizador
        blink_state = !blink_state; // Alterna entre visível/invisível
    }
    // Define a opacidade para piscar
    obj_luz_2.image_alpha = blink_state ? 0.8 : 0.3; // Alterna entre dois valores de alpha
}

// Reduz o recuo gradualmente
if (recoil_timer > 0) {
    recoil_timer -= recoil_speed;

    // Garante que o temporizador não fique negativo
    if (recoil_timer < 0) {
        recoil_timer = 0;
    }
}
