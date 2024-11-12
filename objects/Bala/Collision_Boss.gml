
with (other) {
  hp -= other.dano;  
    mostrar_barra = true;
    

    if (hp <= 0) {
		audio_play_sound(som_dano2, 1, false);
        score += 100;  
         part_particles_create(global.particle_system, x, y, global.particle_explosion, 10);
       
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

