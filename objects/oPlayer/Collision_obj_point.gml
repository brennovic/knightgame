timer_active = false;

show_score_window = true;

// Ativa o diálogo e define as mensagens ao colidir com obj_point
dialogo_ativo = true;
mensagens_dialogo = [
    "Ahhh, caramba, voce conseguiu, hein?! Eu nao tava esperando muito.",
   

];
indice_dialogo = 0; // Começa pela primeira mensagem

    audio_stop_all();
	

if (!audio_is_playing(confete)) {
    audio_play_sound(confete, 1,false); // 'true' para loop contínuo
}
