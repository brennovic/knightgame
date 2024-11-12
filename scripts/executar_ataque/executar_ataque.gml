function executar_ataque() {
    switch (attack_pattern) {
        case 1:
            // Ataque em linha
            for (var i = -2; i <= 2; i++) {
                var proj = instance_create_layer(x, y, "instance", obj_boss_proj);
                proj.direction = point_direction(x, y, oPlayer.x, oPlayer.y) + (i * 10);
                proj.speed = 4; // Velocidade do projétil
            }
            break;

        case 2:
            // Ataque disperso (spray)
            for (var j = 0; j < 5; j++) {
                var proj = instance_create_layer(x, y, "instance", obj_boss_proj);
                proj.direction = point_direction(x, y, oPlayer.x, oPlayer.y) + random_range(-30, 30);
                proj.speed = 4; // Velocidade do projétil
            }
            break;
    }
    // Alterna entre os padrões de ataque
    attack_pattern = choose(1, 2);
}
