event_inherited();

function handle_press(){
	heal(obj_player, obj_run_manager.player_data.max_life);
	obj_run_manager.finished_shopping();
}