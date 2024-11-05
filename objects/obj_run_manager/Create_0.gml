function get_ascension_count(){
	return floor((current_round - 1) / global.cfg_round_count);
}

function record_round_data(){
	if (difficulty == "custom"){
		var _did_change_something = false;
		var _existing_furthest_highscore = obj_save_manager.high_score_custom_farthest_highscore;
		if (
			current_round > _existing_furthest_highscore ||
			(
				current_round == _existing_furthest_highscore &&
				is_fastest_custom_difficulty
			)
		){
			obj_save_manager.high_score_custom_farthest_base_turn_duration = base_turn_duration;
			obj_save_manager.high_score_custom_farthest_highscore = current_round;
			_did_change_something = true;
		}
		
		if (is_fastest_custom_difficulty){
			var _existing_fastest_highscore = obj_save_manager.high_score_custom_fastest_highscore;
			if (current_round > _existing_fastest_highscore){
				obj_save_manager.high_score_custom_fastest_base_turn_duration = base_turn_duration;
				obj_save_manager.high_score_custom_fastest_highscore = current_round;
				_did_change_something = true;
			}
		}
		
		if (_did_change_something) obj_save_manager.write_save();
	} else {
		var _existing_highscore = obj_save_manager.get_highscore(difficulty);
		if (current_round > _existing_highscore){
			obj_save_manager.save_highscore(difficulty, current_round);
			did_beat_highscore = true;
		}
	}
}

function start_current_round(){
	record_round_data();
	
	add_stats(player_data, player_data.stats_gained_per_round);
	
	var _room = asset_get_index("rm_round" + string(current_enemy));
	room_goto(_room);
}

function win_round(){
	audio_play_sound(snd_enemy_die, 50, false);
	goto_shop();
}

function goto_shop(){
	generate_shop_items();
	room_goto(rm_shop);
}

function finished_shopping(){
	++current_round;
	current_enemy = (current_round - 1) % global.cfg_round_count + 1;
	var _ascension_count = get_ascension_count();
	difficulty_multiplier = _ascension_count + power(2, _ascension_count);
	
	var _did_just_ascend = current_round != 1 &&
		(current_round - 1) % global.cfg_round_count == 0;
	if (_did_just_ascend) player_data.turn_duration *= 0.5;
	
	start_current_round();
}

function add_item_to_player(_item_data){
	if (struct_exists(_item_data, "stats")) add_stats(player_data, _item_data.stats);
	if (struct_exists(_item_data, "stat_gain_per_round")) add_stats(player_data.stats_gained_per_round, _item_data.stat_gain_per_round);
	
	if (struct_exists(_item_data, "cost")){
		if (struct_exists(_item_data.cost, "set_current_life_to_1")) player_data.life = 1;
		if (struct_exists(_item_data.cost, "set_current_life_to_max")) player_data.life = player_data.max_life;
	}
}

function ready(){
	is_fastest_custom_difficulty = difficulty == "custom" &&
		(
			obj_save_manager.high_score_custom_fastest_base_turn_duration == 0 ||
			base_turn_duration <= obj_save_manager.high_score_custom_fastest_base_turn_duration
		);
	if (
		is_fastest_custom_difficulty &&
		base_turn_duration < obj_save_manager.high_score_custom_fastest_base_turn_duration
	){
		obj_save_manager.high_score_custom_fastest_highscore = 0;
		obj_save_manager.high_score_custom_fastest_base_turn_duration = base_turn_duration;
	}
	
	if (difficulty != "custom") current_highscore = obj_save_manager.get_highscore(difficulty);

	start_current_round();
}

player_data = create_stats_data(true);
player_data.max_life = 50;
player_data.damage = 10;
player_data.life = player_data.max_life;

did_beat_highscore = false;
current_round = 1;
current_enemy = 1;
difficulty_multiplier = 1;
difficulty = "";
base_turn_duration = -1;
is_fastest_custom_difficulty = false;
current_highscore = -1;