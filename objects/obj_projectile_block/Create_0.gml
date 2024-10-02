event_inherited();

original_set_left = set_is_going_left;
function set_is_going_left(_is_going_left){
	original_set_left(_is_going_left);
	
	// Let the projectile shoot out to the side on the menu (where there's no enemy)
	if (obj_round_manager.is_menu_demo) return;
	
	move_towards_point(target_x, y, move_speed);
}

target_x = room_width * 0.5;
have_reached_target_x = false;
set_is_going_left(false);

++obj_round_manager.num_pending_blocks;