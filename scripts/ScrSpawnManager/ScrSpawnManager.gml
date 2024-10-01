function spawn_enemy(_x, _y){
	return instance_create_layer(_x, _y, global.cfg_layer_enemies, obj_enemy);
}