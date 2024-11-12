// Variáveis principais
var distance = 5; // Distância de movimento
var avoidance_angle_step = 10; // Passo de ângulo para evitar obstáculos
 speed = 1; // Velocidade de movimento

// Verifica se o inimigo foi atingido e aplica tremor
if (hit) {
    x += irandom_range(-1, 1);
    y += irandom_range(-1, 1);
}

// Verifica se o jogador existe na sala
if (instance_exists(oPlayer)) {
    // Calcula a direção para o jogador
    var direction_to_player = point_direction(x, y, oPlayer.x, oPlayer.y);
    var adjusted_direction = direction_to_player;

    // Ajusta a direção para evitar obstáculos
    while (place_meeting(x + lengthdir_x(distance, adjusted_direction), y + lengthdir_y(distance, adjusted_direction), obj_wall)) {
        adjusted_direction += avoidance_angle_step;

        // Limita o ajuste do ângulo para evitar loop infinito
        if (adjusted_direction >= direction_to_player + 180 || adjusted_direction <= direction_to_player - 180) {
            break;
        }
    }

    // Evita colisão com outros inimigos
    if (instance_place(x + lengthdir_x(distance, adjusted_direction), y + lengthdir_y(distance, adjusted_direction), oEnemy) != noone) {
        adjusted_direction += 90;
    }

    // Define a direção ajustada e aplica o movimento
    motion_set(adjusted_direction, speed);
}

// Disparo da bala em direção ao jogador
if (instance_exists(oPlayer)) {
    var direction_to_player = point_direction(x, y, oPlayer.x, oPlayer.y);

    if (alarm[0] <= 0) {
        var bullet = instance_create_layer(x, y, "Weapons", balaenemy);
        bullet.direction = direction_to_player;
        bullet.speed = 4;
        alarm[0] = 60; // Tempo para próximo disparo
    }
}



// Efeito de flash temporário ao ser atingido
if (flash_timer > 0) {
    flash_timer -= 1;
}
