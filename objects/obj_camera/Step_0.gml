// Evento Step - obj_camera

// Verifica se o alvo (target) existe
if (instance_exists(target)) {
    // Interpolação suave para seguir o alvo
    var target_x = lerp(x, target.x - (display_get_width() / (2 * zoom)), lerp_speed);
    var target_y = lerp(y, target.y - (display_get_height() / (2 * zoom)), lerp_speed);
    
    // Limita a posição da câmera dentro dos limites da sala
    x = clamp(target_x, 0, room_width - (display_get_width() / zoom));
    y = clamp(target_y, 0, room_height - (display_get_height() / zoom));

    // Interpolação do zoom para suavizar a transição
    zoom = lerp(zoom, target_zoom, lerp_speed);

    // Atualiza o tamanho e a posição da view com base no zoom e posição atuais
    camera_set_view_size(view_camera[0], display_get_width() / zoom, display_get_height() / zoom);
    camera_set_view_pos(view_camera[0], x, y);
} else {
    // Define target como "noone" para evitar erros em futuras verificações
    target = noone;
}

// Limita o valor do zoom ao intervalo permitido
target_zoom = clamp(target_zoom, min_zoom, max_zoom);
