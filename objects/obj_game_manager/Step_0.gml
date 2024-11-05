refresh_size();

if (bgm_instance == noone && audio_group_is_loaded(audiogroup_music)){
	bgm_instance = audio_play_sound(snd_extradimensional_portalhopping, 0, true);
}