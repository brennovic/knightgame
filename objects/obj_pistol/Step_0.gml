// Verifica se o jogador (oPlayer) existe
if (!instance_exists(oPlayer)) {
    // Destrói a arma se o jogador não existir
    instance_destroy();
    exit; // Sai do código para evitar execução desnecessária
}

// Atualiza a posição da arma em relação ao jogador
x = oPlayer.x ;
y = oPlayer.y ;

// Calcula o ângulo da arma em relação à posição do mouse
image_angle = point_direction(oPlayer.x, oPlayer.y, mouse_x, mouse_y);

// Ajusta a escala vertical para que a arma espelhe corretamente
image_yscale = (image_angle > 90 && image_angle < 270) ? -1 : 1;

// Verifica se o botão esquerdo do mouse foi pressionado
if (mouse_check_button_pressed(mb_left)) {
    // Define a distância à frente da arma onde a bala será criada
    var offset = 10; // Ajuste conforme necessário

    // Calcula a posição exata à frente da arma com base no ângulo da arma
    var bullet_x = x + lengthdir_x(offset, image_angle);
    var bullet_y = y + lengthdir_y(offset, image_angle);

    // Cria a bala na posição calculada
    var bullet = instance_create_layer(bullet_x, bullet_y, "Weapons", Bala); // Ajuste 'Bala' conforme necessário.

    // Define a direção e a velocidade da bala
    bullet.direction = image_angle; // Usa o ângulo da arma diretamente
    bullet.speed = 10; // Velocidade da bala

    // Inicia o recuo ao disparar
    recoil_timer = recoil_distance;

    // Toca o som da arma
    audio_play_sound(snd_guun, 1, false);
}

// Reduz o recuo gradualmente
if (recoil_timer > 0) {
    recoil_timer -= recoil_speed;

    // Garante que o temporizador não fique negativo
    if (recoil_timer < 0) {
        recoil_timer = 0;
    }
}
