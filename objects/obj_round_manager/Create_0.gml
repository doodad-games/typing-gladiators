function get_play_phase_duration(){
	var _duration = 
		base_turn_duration
			* turn_duration_multiplier
			* (1 + obj_player.data.turn_duration);
			
	if (!is_menu_demo) _duration *= (1.01 - 0.01 * current_turn);
	
	return max(1, _duration);
}

function start_play_phase(){
	++current_turn;
	current_phase = "play";
	alarm[0] = get_play_phase_duration();
	
	heal(obj_player, obj_player.data.regen);
	
	if (!is_menu_demo){
		enemy.data.current_command = generate_enemy_command();
		heal(enemy, enemy.data.regen);
		
		audio_play_sound(snd_start_play_phase, 50, false);
	}
}

function end_play_phase(){
	obj_player.data.current_command = string_trim(obj_player.data.current_command);
	execute_command(obj_player);
	
	if (!is_menu_demo) {
		enemy.data.current_command = string_trim(enemy.data.current_command);
		execute_command(enemy);
		
		audio_play_sound(snd_end_play_phase, 50, false);
	}

	start_watch_phase();
}

function start_watch_phase(){
	obj_player.data.current_command = "";
	if (!is_menu_demo) enemy.data.current_command = "";
	
	current_phase = "watch";
}

function end_watch_phase(){
	if (is_menu_demo){
		start_play_phase();
		return;
	}
	
	if (obj_player.data.life <= 0){
		set_game_over();
		return;
	}
	
	if (enemy.data.life <= 0){
		obj_run_manager.win_round();
		return;
	}
	
	start_play_phase();
}

function set_game_over(){
	current_phase = "game_over";
	if (instance_exists(obj_game_over)) return;
	instance_create_depth(room_width * 0.5, room_height * 0.5, global.cfg_depth_game_over, obj_game_over);
	
	var _sound;
	if (obj_run_manager.did_beat_highscore) _sound = snd_lose_run_highscore;
	else _sound = snd_lose_run;
	audio_play_sound(_sound, 50, false);
}

if (instance_exists(obj_run_manager)){
	is_menu_demo = false;
	base_turn_duration = obj_run_manager.base_turn_duration;
} else {
	is_menu_demo = true;
	base_turn_duration = obj_difficulty_manager.selected_turn_duration;
}

// Enemy sets this before this create function executes - don't override it!
//enemy = noone;

current_phase = "";
current_turn = 0;
num_pending_animations = 0;
num_pending_blocks = 0;

current_phase = "watch";