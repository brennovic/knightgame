// Evento Draw da arma

// Calcular a direção da arma (assumindo que ela aponta para o mouse)
var angle = point_direction(x, y, mouse_x, mouse_y);

// Se houver recuo, desenhar a arma com um deslocamento
if (recoil_timer > 0) {
    // Calcular o deslocamento de recuo na direção oposta ao tiro
    var recoil_x = lengthdir_x(-recoil_timer, angle);
    var recoil_y = lengthdir_y(-recoil_timer, angle);
    
    // Desenhar a arma com recuo aplicado
    draw_sprite_ext(sprite_index, image_index, x + recoil_x, y + recoil_y, image_xscale, image_yscale, angle, image_blend, image_alpha);
} else {
    // Desenhar a arma na posição original (sem recuo)
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha);
}
