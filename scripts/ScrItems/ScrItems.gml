global.item_db = {
	amulet_of_fury: {
		display_name: "Amulet of Fury",
		stats: {
			max_life: 3,
			damage: 1,
			accuracy: 0.05,
			evasion: 0.05,
			armour: 1,
			round_duration: 0.05,
		},
	},
	amulet_of_nature: {
		display_name: "Amulet of Nature",
		stat_gain_per_tround: {
			max_life: 4,
		},
	},
	berserker_axe: {
		display_name: "Berserker Axe",
		stats: {
			damage: 15,
			accuracy: -0.1,
		},
	},
	binoculars: {
		display_name: "Binoculars",
		stats: {
			accuracy: 0.25,
			armour: 2,
		},
	},
	broadsword: {
		display_name: "Broadsword",
		stats: {
			damage: 10,
		},
	},
	cape: {
		display_name: "Cape",
		stats: {
			evasion: 0.25,
		},
	},
	chest_plate: {
		display_name: "Chest Plate",
		stats: {
			armour: 10,
		},
	},
	crown_of_thorns: {
		display_name: "Crown of Thorns",
		stats: {
			max_life: 50,
			armour_disabled: 1,
		},
	},
	double_edged_sword: {
		display_name: "Double Edged Sword",
		stats: {
			max_life: -20,
			damage: 20,
		},
	},
	headhunter: {
		display_name: "Headhunter",
		stat_gain_per_tround: {
			damage: 2,
		},
	},
	hermes_boots: {
		display_name: "Hermes Boots",
		stats: {
			accuracy: 0.12,
			evasion: 0.12,
			round_duration: -0.06,
		},
	},
	ring_of_life: {
		display_name: "Ring of Life",
		stats: {
			max_life: 10,
			regen: 1,
		},
	},
	the_devils_card: {
		display_name: "The Devil's Card",
		stats: {
			damage: 20,
		},
		cost: {
			set_current_life_to_1: true,
		},
	},
	the_gods_card: {
		display_name: "The God's Card",
		stats: {
			damage: -5,
			armour: -2,
			regen: 4,
			round_duration: 0.1,
		},
		cost: {
			set_current_life_to_max: true,
		},
	},
	timepiece: {
		display_name: "Timepiece",
		stats: {
			round_duration: 0.25,
		},
	},
};
global.item_ids = struct_get_names(global.item_db);