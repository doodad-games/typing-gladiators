function start_new_run(_base_turn_duration){
	instance_create_layer(0, 0, "Instances", obj_run_manager);
	obj_run_manager.base_turn_duration = _base_turn_duration;
	obj_run_manager.ready();
}

function end_run(){
	instance_destroy(obj_run_manager);
	room_goto(rm_menu);
}

function refresh_size(){
	if (browser_width == last_width && browser_height == last_height) return;
	last_width = browser_width;
	last_height = browser_height;
	window_set_size(browser_width, browser_height);
}

last_width = -1;
last_height = -1;

randomize();
draw_set_font(fnt_default);

room_goto(rm_menu);