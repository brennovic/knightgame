
flash_timer = 0;
caminho = path_add();

target = oPlayer; 
vida = 50;   
vida_maxima = 50;

hit = false; 
hit_timer = 0; 


// Criar o sistema de partículas global
global.particle_system = part_system_create();

// Criar a partícula de explosão
global.particle_explosion = part_type_create();
part_type_shape(global.particle_explosion, pt_shape_explosion);
part_type_size(global.particle_explosion, 0.2, 0.2, 0, 0);
part_type_color1(global.particle_explosion, c_silver);
part_type_alpha3(global.particle_explosion, .5, 0.5, 0);
part_type_speed(global.particle_explosion, 1, 5, 0, 0);
part_type_life(global.particle_explosion, 10, 10);
part_type_direction(global.particle_explosion, 0, 360, 0, 0); // Direção aleatória
// Emitir partículas de explosão ao ser criado
part_particles_create(global.particle_system, x, y, global.particle_explosion, 10);