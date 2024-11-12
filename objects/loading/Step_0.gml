// Diminui o tempo de contagem regressiva a cada frame
countdown_time -= 1/room_speed;

// Verifica se o tempo acabou
if (countdown_time <= 0) {
    // Quando o tempo chega a zero, muda para a próxima room
    room_goto(Room); // Troque 'Room' pelo nome da room para onde você quer ir
}
