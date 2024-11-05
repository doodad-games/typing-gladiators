function base_press(){
	audio_play_sound(click_sound, 0, false);
	handle_press();
}

function handle_press(){}

click_sound = snd_click;
is_pressed = false;