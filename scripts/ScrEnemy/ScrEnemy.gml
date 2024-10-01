function generate_enemy_command(){
	return pick_random(global.cfg_enemy_commands[obj_run_manager.current_enemy - 1]);
}