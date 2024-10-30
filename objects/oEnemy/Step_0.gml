// Verifica se o inimigo foi atingido
if (hit) {
    // Efeito de tremor ao ser atingido
    x += irandom_range(-1, 1);
    y += irandom_range(-1, 1);
}

// Verifica se o jogador existe na sala
if (instance_exists(oPlayer)) {
    // Calcula a direção para o jogador
    var direction_to_player = point_direction(x, y, oPlayer.x, oPlayer.y);
    var adjusted_direction = direction_to_player; 
    var avoidance_angle_step = 10;
    var distance = 5;

    // Ajusta direção para evitar obstáculos
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
    motion_set(adjusted_direction, 1); 
}

// Disparo da bala
if (instance_exists(oPlayer)) {
    var direction_to_player = point_direction(x, y, oPlayer.x, oPlayer.y);

    if (alarm[0] <= 0) {
        var bullet = instance_create_layer(x, y, "Weapons", balaenemy);
        bullet.direction = direction_to_player;
        bullet.speed = 4;
        alarm[0] = 60; 
    }
}

// Evita que o inimigo atravesse a parede
if (place_meeting(x, y, obj_wall)) {
    // Reposiciona ligeiramente para evitar sobreposição e inverte direção
    x -= lengthdir_x(2, direction); // Volta um pouco na direção oposta
    y -= lengthdir_y(2, direction); 
    direction += 180; // Inverte a direção para impedir passagem pela parede
    motion_set(direction, 1); 
}
