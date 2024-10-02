if (
	instance_exists(obj_difficulty_manager) &&
	base_turn_duration != obj_difficulty_manager.selected_turn_duration
){
	base_turn_duration = obj_difficulty_manager.selected_turn_duration;
	if (current_phase == "play") start_play_phase();
}

if (current_phase == "watch"){
	if (num_pending_animations == 0) end_watch_phase();
}