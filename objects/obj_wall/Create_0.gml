if (other == oPlayer) {
    // Reverter o movimento do jogador para evitar que ele atravesse a parede
    x -= other.xprevious - other.x; // Reverte a movimentação no eixo X
    y -= other.yprevious - other.y; // Reverte a movimentação no eixo Y
}
