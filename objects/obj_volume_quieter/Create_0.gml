event_inherited();

function handle_press(){
	var _current_volume = obj_save_manager.get_volume(type);
	var _new_volume = max(0, _current_volume - 0.05);
	if (_current_volume == _new_volume) return;
	obj_save_manager.set_volume(type, _new_volume);
}