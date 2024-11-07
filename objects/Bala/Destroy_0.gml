//Código no evento de destruição do inimigo
if (variable_global_exists("particle_death")) {
    var particle_count = 5;
    part_particles_create(global.p_sys, x, y, global.particle_death, particle_count);
}


