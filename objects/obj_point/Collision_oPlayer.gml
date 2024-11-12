// Confere se o sistema de partículas e o tipo estão configurados
if (global.particle_system != undefined && global.particle_confetti != undefined) {
    // Cria as partículas na posição do ponto de colisão
    var x_pos = other.x;  // Posição X do ponto de colisão
    var y_pos = other.y;  // Posição Y do ponto de colisão
    part_particles_create(global.particle_system, x_pos, y_pos, global.particle_confetti, 20);  // 20 confetes
}

// Opcionalmente destrua o ponto ou outro objeto após a colisão
instance_destroy();
