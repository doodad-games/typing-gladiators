function handle_press(){
	obj_difficulty_manager.selected_difficulty = difficulty;
	obj_difficulty_manager.selected_turn_duration = base_turn_duration;
}

function refresh_selected(){
	var _is_selected_now = obj_difficulty_manager.selected_difficulty == difficulty;
	if (_is_selected_now == is_selected) return;
	is_selected = _is_selected_now;
	
	if (is_selected) sprite_index = spr_difficulty_button_selected;
	else sprite_index = spr_difficulty_button;
}

config = struct_get(global.cfg_difficulties, difficulty);
is_selected = false;

if (difficulty == "custom"){
	base_turn_duration = obj_difficulty_manager.custom_duration;
	fastest_highscore = obj_save_manager.high_score_custom_fastest_highscore;
	fastest_base_turn_duration = obj_save_manager.high_score_custom_fastest_base_turn_duration;
	farthest_highscore = obj_save_manager.high_score_custom_farthest_highscore;
	farthest_base_turn_duration = obj_save_manager.high_score_custom_farthest_base_turn_duration;
} else {
	base_turn_duration = config.base_turn_duration;
	highscore = obj_save_manager.get_highscore(difficulty);
}