// Initialize fade_alpha if it hasn't been defined
if (!variable_instance_exists(self, "fade_alpha")) {
    fade_alpha = 0; // Start with no transparency (fully visible)
}

if (global.life <= 0) {
    // Increment fade_alpha for gradual darkening effect
    fade_alpha = min(fade_alpha + 0.01, 1); // Increase alpha by 0.01 each frame, max at 1 (fully black)

    // Draw black rectangles (letterbox bars)
    var altura_barra = 1000;
    draw_set_alpha(fade_alpha);
    draw_rectangle_color(0, 0, display_get_width(), altura_barra, c_black, c_black, c_black, c_black, false);
    draw_rectangle_color(0, display_get_height() - altura_barra, display_get_width(), display_get_height(), c_black, c_black, c_black, c_black, false);

    // Draw "Game Over" text with fade effect
    draw_set_font(Font1);
    draw_set_color(c_white);
    draw_text(display_get_width() / 2, display_get_height() / 2, "GAME OVER");
	 draw_text(display_get_width() / 2, display_get_height() / 2 +30, "Aperte R para o restart");
    draw_set_alpha(1); // Reset alpha for future drawing
}
