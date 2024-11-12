if (dialogo_ativo && (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_enter))) {
    dialogo_atual += 1; // Avança para o próximo diálogo

    // Se ainda houver diálogos no array, continue exibindo
    if (dialogo_atual < array_length(dialogos)) {
        dialogo_ativo = true;
    } else {
        // Todos os diálogos foram exibidos
        dialogo_ativo = false;
    }
}
