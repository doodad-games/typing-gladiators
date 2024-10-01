function handle_press(){
	show_debug_message(difficulty);
	show_debug_message(base_turn_duration);
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
} else {
	base_turn_duration = config.base_turn_duration;
}