
with (other) {
    vida -= other.dano;  
    
    
    if (vida <= 0) {
		audio_play_sound(som_dano2, 1, false);
        score += 30;  

        instance_destroy(); // Destroi o inimigo
    }
}
with (other) {
    hit = true; 
    image_blend = c_white;
    alarm[0] = 10;
}
var dano_causado = 10; 
var obj_dano_inst = instance_create_layer(other.x, other.y, "Weapons", obj_dano);
obj_dano_inst.dano = dano_causado;

instance_destroy();


