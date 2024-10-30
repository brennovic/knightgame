// Evento de colisão entre Bala e Wall
if (place_meeting(x, y, obj_wall)) {
    instance_destroy(); // Destrói a bala quando colide com a parede
}
