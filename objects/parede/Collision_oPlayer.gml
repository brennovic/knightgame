// Código no evento de Colisão: obj_enemy - obj_player
instance_destroy(oPlayer);
room_goto(rm_menu); // rm_gameover é um exemplo, substitua pelo nome da room desejada.
game_restart();