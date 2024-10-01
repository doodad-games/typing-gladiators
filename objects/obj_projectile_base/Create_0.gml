function set_is_going_left(_is_going_left){
	is_going_left = _is_going_left;
	var _extrapolated_x;
	
	if (_is_going_left){
		image_xscale = -1;
		_extrapolated_x = x - 123456;
	} else {
		image_xscale = 1;
		_extrapolated_x = x + 123456;
	}
	
	move_towards_point(_extrapolated_x, y, move_speed);
}

function hit_unit(_target){}

owner = noone;
is_going_left = false;

set_is_going_left(false);

++obj_tround_manager.num_pending_animations;