function save_changes(){
	obj_save_manager.last_selected_difficulty = selected_difficulty;
	obj_save_manager.last_custom_duration = custom_duration;
	obj_save_manager.write_save();
}

function make_custom_duration_faster(){
	selected_difficulty = "custom";
	custom_duration = max(15, custom_duration - 15);
	selected_turn_duration = custom_duration;
}

function make_custom_duration_slower(){
	selected_difficulty = "custom";
	custom_duration = custom_duration + 15;
	selected_turn_duration = custom_duration;
}

custom_duration = obj_save_manager.last_custom_duration;
selected_difficulty = obj_save_manager.last_selected_difficulty;

if (selected_difficulty == "custom") selected_turn_duration = custom_duration;
else selected_turn_duration = struct_get(global.cfg_difficulties, selected_difficulty).base_turn_duration;
