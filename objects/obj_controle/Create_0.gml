


global.p_sys = part_system_create();
part_system_depth(global.p_sys, -100); 

global.particle_death = part_type_create();
part_type_shape(global.particle_death, pt_shape_pixel); // Forma da explosão
part_type_size(global.particle_death, 0.5, 0.5, 0, 0); // Tamanho inicial e final
part_type_life(global.particle_death, 30, 60); // Duração das partículas em steps (30 a 60)
part_type_colour3(global.particle_death, c_red, c_orange, c_yellow); // Transição de cor
part_type_alpha3(global.particle_death, 1, 0.5, 0); // Transparência gradual
part_type_speed(global.particle_death, 2, 4, -0.1, 0); // Velocidade
part_type_direction(global.particle_death, 0, 360, 0, 0); // Direção aleatória
