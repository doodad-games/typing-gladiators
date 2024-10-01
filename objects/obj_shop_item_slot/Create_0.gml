function refresh(){
	item_id = global.shop_items[index];
	
	if (item_display != noone) instance_destroy(item_display);
	item_display = noone;
	
	if (item_id == "") return;
	var _item_asset = asset_get_index("obj_item_" + string(item_id));
	item_display = instance_create_layer(x, y, "Instances", _item_asset);
}

item_id = "";
item_display = noone;
refresh();