event_inherited();

var _half_difficulty_multiplier = 1 + (obj_run_manager.difficulty_multiplier - 1) * 0.5;

data.max_life *= obj_run_manager.difficulty_multiplier;
data.damage = floor(data.damage * _half_difficulty_multiplier);
data.armour = floor(data.armour * _half_difficulty_multiplier);
data.regen = floor(data.regen * _half_difficulty_multiplier);
data.accuracy = max(
	data.accuracy * obj_run_manager.difficulty_multiplier,
	data.accuracy
);
data.evasion = floor(max(
	data.evasion * (1 + sqrt(obj_run_manager.difficulty_multiplier - 1) * 0.33),
	data.evasion
) * 100) / 100;

obj_tround_manager.enemy = self;
data.current_command = "";
data.life = data.max_life;