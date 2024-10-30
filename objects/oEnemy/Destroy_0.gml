// Incrementa a contagem de inimigos mortos
global.enemy_kills += 1;


// Código no evento de destruição do inimigo
if (variable_global_exists("particle_death")) {
    var particle_count = 20;
    part_particles_create(global.p_sys, x, y, global.particle_death, particle_count);
}


// Checa se 5 inimigos foram destruídos
if (global.enemy_kills >= 5) {
    // Destrói a parede (obj_wall)
    with (parede) {
        instance_destroy();
    }
}
