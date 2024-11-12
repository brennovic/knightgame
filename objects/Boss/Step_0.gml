// Movimento direto na direção do jogador
if (instance_exists(oPlayer)) {
    var direction_to_player = point_direction(x, y, oPlayer.x, oPlayer.y);
    var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);

    if (distance_to_player > 50) { // Mantém certa distância antes de se aproximar totalmente
        motion_set(direction_to_player, move_speed); // Usa a velocidade definida no Create
    } else {
        motion_set(0, 0); // Para o movimento quando está próximo o suficiente
    }
}

// Controle do tempo para atacar
if (attack_timer <= 0) {
    executar_ataque(); // Executa o ataque
    attack_timer = irandom_range(60, 120); // Reseta o timer para o próximo ataque
} else {
    attack_timer -= 1;
}
if (hp <= 0) {
    instance_destroy(); // Destrói o chefe ao morrer
}
// Verifica a vida do chefe

image_xscale = 2
image_yscale = 2