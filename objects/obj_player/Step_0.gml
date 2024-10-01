if (!instance_exists(obj_tround_manager)) return;

function process_command_input(){
	for (var _i = string_length(global.cfg_command_input_keys); _i != 0; --_i){
		var _key = string_char_at(global.cfg_command_input_keys, _i);
		if (!keyboard_check_pressed(ord(_key))) continue;
		data.current_command += _key;
		break;
	}

	if (keyboard_check_pressed(vk_backspace)){
		data.current_command = "";
	}

	if (keyboard_check_pressed(vk_enter)){
		obj_tround_manager.end_play_phase();
	}
}


if (obj_tround_manager.current_phase == "play"){
	process_command_input();
}