
if (!instance_exists(obj_wave)) {
    instance_create_layer(x, y, "instance", obj_wave);
} else {
    obj_wave.active = true; // Se o obj_wave já existir, ativa ele
}

if (!audio_is_playing(som_fundo)) {
    audio_play_sound(som_fundo, 1, true); // 'true' para loop contínuo
}