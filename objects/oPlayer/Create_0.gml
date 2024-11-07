spd = 3;

global.life = 4
slide_speed = 8; 
slide_friction = 0.95; 
is_sliding = false;
dash_speed = 12;        
dash_time = 8;        
dash_timer = 0;         
is_dashing = false;    
dash_cooldown = 180;       
dash_cooldown_timer = 0;   
dash_trail = [];        
global.enemy_kills = 0;
run_sprite = run_1;  
idle_sprite = idle_1; 
slide_sprite = slide;  


global.player_collided_with_floor = false;










// Configurações do sistema de partículas
part_sistema = part_system_create();      // Cria o sistema de partículas
part_tipo = part_type_create();           // Cria o tipo de partícula

// Configurações da aparência das partículas
part_type_shape(part_tipo, pt_shape_cloud);           // Formato da partícula
part_type_size(part_tipo, 0.1, 0.1, 0, 0);           // Tamanho da partícula
part_type_color1(part_tipo, make_color_rgb(200, 200, 200));  // Cor
part_type_alpha2(part_tipo, 0.5, 0);                   // Alpha (desaparece com o tempo)
part_type_speed(part_tipo, 1, 2, 0, 0);              // Velocidade
part_type_direction(part_tipo, 85, 95, 0, 0);        // Direção das partículas
part_type_gravity(part_tipo, 0.1, 270);              // Gravidade para "cair"

// Define o tempo de vida das partículas
part_type_life(part_tipo, 10, 20);                   // Tempo de vida (em frames)

// Cria um emissor que emitirá partículas
emissor = part_emitter_create(part_sistema);
part_emitter_region(part_sistema, emissor, x, x, y, y, ps_shape_ellipse, ps_distr_gaussian);
altura_do_personagem = 6;






// Cria o sistema de partículas
part_sistema = part_system_create();
emissor = part_emitter_create(part_sistema);

// Define a profundidade do sistema de partículas para que ele apareça atrás do player
part_system_depth(part_sistema, depth + 1); // Ajusta a profundidade para logo atrás do player

// Configura a região do emissor para emitir partículas nos "pés" do personagem
altura_do_personagem = 6;  // Defina a altura dos pés
part_emitter_region(part_sistema, emissor, x - 4, x + 4, y + altura_do_personagem, y + altura_do_personagem, ps_shape_ellipse, ps_distr_gaussian);
