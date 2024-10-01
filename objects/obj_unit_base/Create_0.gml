function emit_projectile(_projectile_name, _launch_anchor){
	var _asset = asset_get_index("obj_projectile_" + _projectile_name);
	
	var _x;
	if (anchors_on_left) _x = -160;
	else _x = 160;
	
	var _y = struct_get(anchors, _launch_anchor);
	
	var _projectile = instance_create_layer(x + _x, y + _y, "Instances", _asset);
	_projectile.owner = self;
	_projectile.set_is_going_left(anchors_on_left);
}

anchors = {
	high: -128,
	body: 0,
	low: 128,
};