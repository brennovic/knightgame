xMove = keyboard_check(ord("D")) - keyboard_check(ord("A"));
yMove = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Normalizar o movimento para manter a mesma velocidade em todas as direções
var move_length = point_distance(0, 0, xMove, yMove);
if (move_length > 0) {
    xMove /= move_length;
    yMove /= move_length;
}

// Se o personagem está dando dash
if (is_dashing) {
    dash_timer -= 1;
	// Adiciona a posição atual à lista de rastro
    array_push(dash_trail, [x, y]);
    if (dash_timer <= 0) {
        is_dashing = false; 
        spd = 3;        
		 // Limpa o rastro após o dash
    dash_trail = [];    // Limpa a lista de rastro
    }
}
// Reduzir o cooldown se estiver ativo
if (dash_cooldown_timer > 0) {
    dash_cooldown_timer -= 1;
}


var new_x = x + xMove * (is_dashing ? dash_speed : spd);
var new_y = y + yMove * (is_dashing ? dash_speed : spd);


if (!place_meeting(new_x, y, obj_wall)) {
    x = new_x;
}

if (!place_meeting(x, new_y, obj_wall)) {
    y = new_y;
}


if (xMove != 0 || yMove != 0) {
    sprite_index = run_1;
} else {
    sprite_index = idle_1;
}


// Ajusta o espelhamento com base no movimento horizontal
if (xMove != 0) {
    image_xscale = sign(xMove);
}


//if (keyboard_check_pressed(vk_space) && !is_dashing) {
   // is_dashing = true;         
   // dash_timer = dash_time;    
 
//}




if (keyboard_check_pressed(vk_space) && !is_dashing && dash_cooldown_timer <= 0) {
    is_dashing = true;       
    dash_timer = dash_time;   
    dash_cooldown_timer = dash_cooldown; 
	audio_play_sound(dash_som, 1, false);
}

