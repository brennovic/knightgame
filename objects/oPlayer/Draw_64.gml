draw_sprite_ext(_11, 0, 1250, 5, -3, 3, 0, c_white, 1);

draw_set_color(c_black)
draw_text(1110, 30, "Pontos: " + string(score));

if (timer_active) {
	draw_set_color(c_black)
    // Exibe o tempo em segundos, arredondado para um número inteiro
    draw_text(1110, 60, "Tempo: " + string(floor(time_elapsed)) + " s");
}

// Se a janela de pontuação final estiver ativada, exibe-a no centro da tela
if (show_score_window) {
    // Calcula as posições para centralizar a janela
    var window_width = 300;
    var window_height = 150;
    var center_x = (display_get_width() - window_width) / 2;
    var center_y = (display_get_height() - window_height) / 2;

    // Desenha o fundo da janela
    draw_set_color(c_black);
    draw_rectangle(center_x, center_y, center_x + window_width, center_y + window_height, false);

    // Desenha o contorno da janela
    draw_set_color(c_white);
    draw_rectangle(center_x, center_y, center_x + window_width, center_y + window_height, true);

    // Exibe a pontuação e o tempo final dentro da janela
    draw_set_color(c_white);
    draw_text(center_x + 20, center_y + 30, "Pontos Finais: " + string(score));
    draw_text(center_x + 20, center_y + 60, "Tempo Final: " + string(floor(time_elapsed)) + " s");
}

