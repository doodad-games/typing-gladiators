if (instance_exists(obj_run_manager)){
	data = obj_run_manager.player_data;
} else {
	data = create_stats_data(true);
	data.max_life = 1;
	data.life = data.max_life;
}

data.current_command = "";
anchors_on_left = false;

event_inherited();