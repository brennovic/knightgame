// Variável que controla o estado do fullscreen
var is_fullscreen = false;

// Função para alternar o modo fullscreen
if (keyboard_check_pressed(vk_f11)) {  // Por exemplo, pressionando F11
    is_fullscreen = !is_fullscreen;
    window_set_fullscreen(is_fullscreen);
}