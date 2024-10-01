function create_fct(_spawner, _text){
	var _fct = instance_create_depth(_spawner.x, _spawner.y - 16, global.cfg_depth_fct, obj_fct);
	_fct.text = _text;
}