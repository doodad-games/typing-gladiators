function get_ascension_count(){
	return floor((current_tround - 1) / global.cfg_tround_count);
}

function start_current_tround(){
	add_stats(player_data, player_data.stats_gained_per_tround);
	
	var _room = asset_get_index("rm_round" + string(current_enemy));
	room_goto(_room);
}

function win_tround(){
	goto_shop();
}

function goto_shop(){
	generate_shop_items();
	room_goto(rm_shop);
}

function finished_shopping(){
	++current_tround;
	current_enemy = (current_tround - 1) % global.cfg_tround_count + 1;
	var _ascension_count = get_ascension_count();
	difficulty_multiplier = _ascension_count + power(2, _ascension_count);
	
	var _did_just_ascend = current_tround != 1 &&
		(current_tround - 1) % global.cfg_tround_count == 0;
	if (_did_just_ascend) player_data.round_duration *= 0.5;
	
	start_current_tround();
}

function add_item_to_player(_item_data){
	if (struct_exists(_item_data, "stats")) add_stats(player_data, _item_data.stats);
	if (struct_exists(_item_data, "stat_gain_per_tround")) add_stats(player_data.stats_gained_per_tround, _item_data.stat_gain_per_tround);
	
	if (struct_exists(_item_data, "cost")){
		if (struct_exists(_item_data.cost, "set_current_life_to_1")) player_data.life = 1;
		if (struct_exists(_item_data.cost, "set_current_life_to_max")) player_data.life = player_data.max_life;
	}
}

function ready(){
	start_current_tround();
}

player_data = create_stats_data(true);
player_data.max_life = 50;
player_data.damage = 10;
player_data.life = player_data.max_life;

current_tround = 1;
current_enemy = 1;
difficulty_multiplier = 1;
base_turn_duration = -1;