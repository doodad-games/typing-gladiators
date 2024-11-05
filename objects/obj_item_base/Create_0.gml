event_inherited();

function handle_press(){
	obj_run_manager.add_item_to_player(item_data);
	obj_run_manager.finished_shopping();
}

function use_item(_item_id){
	item_id = _item_id;
	item_data = struct_get(global.item_db, _item_id);
}

click_sound = snd_get_item;
item_id = "";
item_data = {};
is_pressing = false;