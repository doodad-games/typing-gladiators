global.cfg_command_input_keys = "ABCDEFGHIJKLMNOPQRSTUVWXYZ 0123456789";
global.cfg_commands = [
	"OVERHEAD",
	"BODY STRIKE",
	"LOW BLOW",
	"HIGH BLOCK",
	"BODY BLOCK",
	"LOW BLOCK",
];
global.cfg_commands_count = array_length(global.cfg_commands);
global.cfg_depth_fct = -100;
global.cfg_depth_game_over = -150;
global.cfg_depth_game_over_leave_button = -151;
global.cfg_difficulties = {
	slow: { base_turn_duration: 360, display_name: "Slow" },
	medium: { base_turn_duration: 270, display_name: "Medium" },
	fast: { base_turn_duration: 180, display_name: "Fast" },
	custom: { display_name: "Custom" },
};
global.cfg_enemy_commands = [
	[
		"OVERHEAD",
		"BODY STRIKE",
		"LOW BLOW",
		"HIGH BLOCK",
		"BODY BLOCK",
		"LOW BLOCK",
		"THINK",
	],
	[
		"OVERHEAD",
		"BODY STRIKE",
		"LOW BLOW",
		"BODY BLOCK",
		"FLEX",
	],
	[
		"BODY STRIKE",
		"HIGH BLOCK",
		"BODY BLOCK",
		"LOW BLOCK",
	],
	[
		"LOW BLOW",
		"LOW BLOCK",
	],
	[
		"OVERHEAD",
		"BODY STRIKE",
	],
	[
		"ROCK",
	],
	[
		"OVERHEAD",
		"BODY STRIKE",
		"LOW BLOW",
		"HIGH BLOCK",
		"BODY BLOCK",
		"LOW BLOCK",
	],
];
global.cfg_stats = [
	"max_life",
	"damage",
	"accuracy",
	"evasion",
	"armour",
	"armour_disabled",
	"regen",
	"turn_duration",
];
global.cfg_stats_count = array_length(global.cfg_stats);
global.cfg_round_count = 7;