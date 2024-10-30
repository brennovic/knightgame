// Incrementa o timer
timer += 1;

// Se o timer atingir o intervalo definido, atira uma flecha
if (timer >= shoot_interval) {
    // Calcula a posição central do lançador
    var arrow_x = x - (sprite_width / 2);
    var arrow_y = y + (sprite_height / 2);

    // Cria a flecha no meio do lançador
    var new_arrow = instance_create_layer(arrow_x, arrow_y, "instance", obj_arrow);

    // Define a direção da flecha para a esquerda
    new_arrow.direction = 180;

    // Reinicia o timer para o próximo disparo
    timer = 0;
}
