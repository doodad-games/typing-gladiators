event_inherited();

function handle_press(){
	obj_difficulty_manager.save_changes();
	obj_game_manager.start_new_run(obj_difficulty_manager.selected_turn_duration);
}