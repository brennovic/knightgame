// Evento Collision (bala vs inimigo)
with (other) {
    global.life--  
    
audio_play_sound(som_dano, 1, false);
  
    if (global.life <= 0) {
        instance_destroy();  
		room_goto(rm_menu); 
		game_restart();
    }
}
// Destrói a bala após a colisão
instance_destroy();
