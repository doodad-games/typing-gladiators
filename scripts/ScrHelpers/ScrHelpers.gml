global.longest_stat_display_name = string_length("Armour Disabled");

function duration_in_frames_to_display_string(_duration){
	return string(round(_duration / 0.6) / 100) + "s";
}

function pick_random(_array){
	return _array[irandom(array_length(_array) - 1)];
}

function object_get_base(_object){
	var _parent = object_get_parent(_object);
	if (_parent == -100 || _parent == -1) return _object;
	else return object_get_base(_parent);
}

function check_bool_stat(_value){
	return _value >= 1;
}

function pad_stat_display_name(_stat_display_name){
	var _num_spaces = max(0, global.longest_stat_display_name - string_length(_stat_display_name));
	return _stat_display_name + ": " + string_repeat(" ", _num_spaces);
}

function get_stat_description(_data, _stat, _stat_display_name, _is_pct, _with_plus){
	if (!struct_exists(_data, _stat)) return "";
	var _amount = struct_get(_data, _stat);
	
	if (_stat == "armour" && instance_exists(obj_round_manager))
		_amount = max(0, _amount - obj_round_manager.current_turn + 1);
	
	if (_amount == 0) return "";

	var _amount_text;
	if (_is_pct) _amount_text = string(_amount * 100) + "%";
	else _amount_text = string(_amount);
	if (_with_plus && _amount >= 0) _amount_text = "+" + _amount_text;
	return pad_stat_display_name(_stat_display_name) + _amount_text + "\n";
}

function get_stat_description_armour(_data){
	if (struct_exists(_data, "armour_disabled")){
		var _is_armour_disabled = check_bool_stat(struct_get(_data, "armour_disabled"));
		if (_is_armour_disabled){
			return pad_stat_display_name("Armour Disabled") + "Yes\n";
		}
	}
	
	return get_stat_description(_data, "armour", "Armour", false, false);
}

function get_full_stat_description(_data){
	var _description = "";
	
	_description += get_stat_description(_data, "max_life", "Max Life", false, false);
	_description += get_stat_description(_data, "damage", "Damage", false, false);
	_description += get_stat_description(_data, "accuracy", "Accuracy", true, true);
	_description += get_stat_description(_data, "evasion", "Evasion", true, false);
	_description += get_stat_description_armour(_data);
	_description += get_stat_description(_data, "regen", "Regen", false, false);
	_description += get_stat_description(_data, "turn_duration", "Turn Duration", true, true);
	
	return _description;
}

function get_item_description(_item_data){
	var _description = "";
	
	if (struct_exists(_item_data, "stats")) _description += get_full_stat_description(_item_data.stats);
	if (struct_exists(_item_data, "cost")){
		if (struct_exists(_item_data.cost, "set_current_life_to_1")){
			_description += "One-off: Current life becomes 1\n";
		}
		if (struct_exists(_item_data.cost, "set_current_life_to_max")){
			_description += "One-off: Restore all missing life\n";
		}
	}
	if (struct_exists(_item_data, "stat_gain_per_round")){
		_description += "Permanent stats added per round:\n";
		_description += get_full_stat_description(_item_data.stat_gain_per_round);
	}
	
	return _description;
}