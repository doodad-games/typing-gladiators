function create_stats_data(_is_for_player){
	var _data = {
		max_life: 0,
		damage: 0,
		accuracy: 0,
		evasion: 0,
		armour: 0,
		armour_disabled: 0,
		regen: 0,
	};
	
	if (_is_for_player){
		_data.turn_duration = 0;
		
		_data.stats_gained_per_round = {
			max_life: 0,
			damage: 0,
			accuracy: 0,
			evasion: 0,
			armour: 0,
			armour_disabled: 0,
			regen: 0,
			turn_duration: 0,
		};
	}
	
	return _data;
}

function add_stats(_recipient, _stats_to_add){
	for (var _i = 0; _i != global.cfg_stats_count; ++_i){
		var _stat = global.cfg_stats[_i];
		if (!struct_exists(_stats_to_add, _stat)) continue;
		var _adding_value = struct_get(_stats_to_add, _stat);
		var _new_value = struct_get(_recipient, _stat) + _adding_value;
		struct_set(_recipient, _stat, _new_value);
		
		if (_stat == "max_life"){
			_recipient.max_life = max(1, _recipient.max_life);
			
			if (struct_exists(_recipient, "life")){
				_recipient.life = min(
					_recipient.max_life,
					_recipient.life + max(0, _adding_value)
				);
			}
		}
	}
}

function heal(_recipient, _amount){
	_recipient.data.life = min(
		_recipient.data.max_life,
		_recipient.data.life + _amount
	);
}

function attack(_from, _to, _projectile){
	var _hit_chance = 1 + _from.data.accuracy - _to.data.evasion;
	if (_hit_chance < 1 && random(1) > _hit_chance){
		create_fct(_projectile, "MISS");
		audio_play_sound(snd_evade_hit, 100, false);
		return;
	}
	
	do_damage(_from, _to, _projectile);
}

function get_effective_armour(_armour){
	return max(0, floor(_armour * (1.05 - obj_round_manager.current_turn * 0.05)));
}

function do_damage(_from, _to, _projectile){
	var _armour;
	if (check_bool_stat(_to.data.armour_disabled)) _armour = 0;
	else _armour = get_effective_armour(_to.data.armour);

	var _amount = max(1, _from.data.damage - _armour);
	_to.data.life -= _amount;
	
	create_fct(_projectile, "-" + string(_amount));
	
	var _sound;
	if (_amount <= 3) _sound = snd_receive_hit_high_armour;
	else if (_to.object_index == obj_player) _sound = snd_receive_hit_player;
	else _sound = snd_receive_hit_enemy;
	audio_play_sound(_sound, 100, false);
}

function draw_common_unit(){
	draw_command();
	
	if (!instance_exists(obj_run_manager)) return;
	
	draw_life();
	draw_debug_data();
}

function draw_command(){
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text(x, y - 128, data.current_command);
}

function draw_life(){
	draw_set_color(c_black);
	draw_rectangle(x - 32, y - 16, x + 32, y + 16, false);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, y, data.life);
}

function draw_debug_data(){
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	draw_text(x - 172, y + 128, get_full_stat_description(self.data));
}