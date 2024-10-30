// No evento Mouse Left Pressed do obj_pause_menu
if (global.is_paused) {
    var mx = mouse_x;
    var my = mouse_y;

    // Detecta clique no botão "Continuar"
    if (mx > button_continue_x && mx < button_continue_x + button_continue_w &&
        my > button_continue_y && my < button_continue_y + button_continue_h) {
        global.is_paused = false;    // Retomar o jogo
        audio_resume_all();
    }

    // Detecta clique no botão "Retornar ao Menu"
    if (mx > button_menu_x && mx < button_menu_x + button_menu_w &&
        my > button_menu_y && my < button_menu_y + button_menu_h) {
        room_goto(rm_main_menu);     // Substitua 'rm_main_menu' pelo nome da sala de menu principal
    }
}
