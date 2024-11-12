hp = 500; // Vida do chefe
attack_timer = 0;
move_direction = point_direction(x, y, oPlayer.x, oPlayer.y); // Inicia indo em direção ao jogador
move_speed = 1;
attack_pattern = choose(1, 2); // Alterna entre padrões de ataque

hp_max = 150; // Vida máxima do chefe
mostrar_barra = false; // Controla se a barra será exibida
flash_timer = 0;