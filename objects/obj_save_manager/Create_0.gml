data_types = {
	last_selected_difficulty: "medium",
	last_custom_duration: 240,
	high_score_slow_highscore: 0,
	high_score_medium_highscore: 0,
	high_score_fast_highscore: 0,
	high_score_custom_fastest_highscore: 0,
	high_score_custom_farthest_highscore: 0,
	high_score_custom_fastest_base_turn_duration: 0,
	high_score_custom_farthest_base_turn_duration: 0,
	volume_master: 0.75,
	volume_music: 0.75,
	volume_sfx: 0.75,
};
data_type_keys = struct_get_names(data_types);
data_type_keys_length = array_length(data_type_keys);

function get_highscore(_difficulty){
	return variable_instance_get(id, "high_score_" + _difficulty + "_highscore");
}

function save_highscore(_difficulty, _highscore){
	variable_instance_set(id, "high_score_" + _difficulty + "_highscore", _highscore);
	write_save();
}

function get_volume(_type){
	return variable_instance_get(id, "volume_" + _type);
}

function set_volume(_type, _volume){
	variable_instance_set(id, "volume_" + _type, _volume);
	alarm[0] = 15;
}

function write_save(){
	ini_open("save_data");
	
	for (var _i = 0; _i != data_type_keys_length; ++_i){
		var _key = data_type_keys[_i];
		var _default_value = struct_get(data_types, _key);
		var _type = typeof(_default_value);
	
		var _write_function;
		if (_type == "string") _write_function = ini_write_string;
		else _write_function = ini_write_real;
	
		var _value = variable_instance_get(id, _key);
		_write_function("main", _key, _value);
	}
	
	ini_close();
}

ini_open("save_data");

for (var _i = 0; _i != data_type_keys_length; ++_i){
	var _key = data_type_keys[_i];
	var _default_value = struct_get(data_types, _key);
	var _type = typeof(_default_value);
	
	var _read_function;
	if (_type == "string") _read_function = ini_read_string;
	else _read_function = ini_read_real;
	
	var _value = _read_function("main", _key, _default_value);
	variable_instance_set(id, _key, _value);
}

ini_close();