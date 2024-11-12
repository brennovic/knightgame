
global.particle_system = part_system_create();
part_system_depth(global.particle_system, -100);  // Define a profundidade para desenhar sobre outros objetos

// Criando o tipo de partícula "confete"
global.particle_confetti = part_type_create();
part_type_shape(global.particle_confetti, pt_shape_pixel);  // Formato de círculo
part_type_size(global.particle_confetti, 0.3, 0.5, 0, 0);   // Tamanho inicial e escala
part_type_color1(global.particle_confetti, c_blue);          // Cor inicial (pode ser alterada)

part_type_alpha3(global.particle_confetti, 1, 1, 0);        // Alfa (transparência) vai de 1 a 0

// Configuração de direção e velocidade
part_type_direction(global.particle_confetti, 0, 360, 0, 10);
part_type_speed(global.particle_confetti, 1, 3, 0, 0);
part_type_life(global.particle_confetti, 30, 60);          // Vida da partícula em frames
