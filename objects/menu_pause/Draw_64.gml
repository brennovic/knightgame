// No evento Draw do obj_pause_menu
if (global.is_paused) {
    // Desenha um fundo semitransparente para o menu
    draw_set_alpha(0.5);
    draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
    draw_set_alpha(1);

    // Título do menu
    draw_set_halign(fa_left);
    draw_text(button_start_x, button_start_y - 30, "PAUSE");  // Título no canto superior esquerdo

    // Desenha o botão "Continuar"
    draw_rectangle(button_continue_x, button_continue_y, button_continue_x + button_continue_w, button_continue_y + button_continue_h, false);
    draw_text(button_continue_x + 10, button_continue_y + button_continue_h / 2 - 8, "Continuar");

    // Desenha o botão "Retornar ao Menu"
    draw_rectangle(button_menu_x, button_menu_y, button_menu_x + button_menu_w, button_menu_y + button_menu_h, false);
    draw_text(button_menu_x + 10, button_menu_y + button_menu_h / 2 - 8, "Retornar ao Menu");
}
