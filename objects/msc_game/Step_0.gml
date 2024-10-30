// Verifica se a música não está tocando antes de iniciá-la
if (!audio_is_playing(som_fundo)) {
    audio_play_sound(som_fundo, 1, true); // 'true' para loop contínuo
}