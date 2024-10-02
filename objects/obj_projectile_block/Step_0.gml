event_inherited();

if (!have_reached_target_x){
	if (abs(target_x - x) > 10) return;
	have_reached_target_x = true;
	speed = 0;
}

if (!have_reached_target_x) return;

if (obj_round_manager.num_pending_animations - obj_round_manager.num_pending_blocks == 0){
	instance_destroy();
}