// Evento Step
tiro_timer += 1; // Incrementa o timer
if (tiro_timer >= tiro_intervalo) {
    tiro_timer = 0; // Reseta o timer
    instance_create_layer(x, y, "instance", obj_arrow2); // Cria a flecha
}
