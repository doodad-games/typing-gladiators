event_inherited();

if (!obj_round_manager.is_menu_demo && !have_reached_target_x){
	if (
		(is_going_left && x > target_x) ||
		(!is_going_left && x < target_x)
	) return;
	have_reached_target_x = true;
	speed = 0;
}

if (!have_reached_target_x) return;

if (obj_round_manager.num_pending_animations - obj_round_manager.num_pending_blocks == 0){
	instance_destroy();
}