
with (other) {
    vida -= other.dano;  
    
    
    if (vida <= 0) {
		audio_play_sound(som_dano2, 1, false);
        instance_destroy();  
    }
}
with (other) {
    hit = true; 
    image_blend = c_white;
    alarm[0] = 10;
}



// Suponha que "dano_causado" seja o valor do dano da bala
var dano_causado = 10; // Defina o valor do dano de acordo com seu jogo

// Cria uma instância de `obj_dano` na posição do inimigo
var obj_dano_inst = instance_create_layer(other.x, other.y, "Weapons", obj_dano);
obj_dano_inst.dano = dano_causado; // Define o valor do dano a ser exibido


// Destrói a bala após a colisão
instance_destroy();


