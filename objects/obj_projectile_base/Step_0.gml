if (obj_round_manager.current_phase != "watch") return;

var _other = instance_place(x, y, all);
if (_other == noone) return;

var _type = _other.object_index;

if (_other.object_index == obj_projectile_block){
	create_fct(_other, "BLOCK");
	audio_play_sound(snd_block_projectile, 100, false);
	instance_destroy();
	instance_destroy(_other);
} else if (object_get_base(_other.object_index) == obj_unit_base){
	hit_unit(_other);
	instance_destroy();
}