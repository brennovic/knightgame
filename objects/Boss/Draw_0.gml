if (flash_timer > 0) {
    // Ativa o efeito de fog para flash branco
    gpu_set_fog(true, c_white, 0, 100); // c_white para cor branca e valores de início e fim ajustáveis
    draw_self();
    gpu_set_fog(false, 0, 0, 0); // Desativa o fog depois de desenhar
    flash_timer -= 1; // Reduz o tempo do efeito de flash
} else {
    // Desenha normalmente quando o timer é zero
    draw_self();
}

