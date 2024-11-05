function execute_command(_unit){
	if (_unit.data.current_command == "OVERHEAD"){
		return _unit.emit_projectile("attack", "high");
	}
	
	if (_unit.data.current_command == "HIGH BLOCK"){
		return _unit.emit_projectile("block", "high");
	}
	
	if (_unit.data.current_command == "BODY STRIKE"){
		return _unit.emit_projectile("attack", "body");
	}
	
	if (_unit.data.current_command == "BODY BLOCK"){
		return _unit.emit_projectile("block", "body");
	}
	
	if (_unit.data.current_command == "LOW BLOW"){
		return _unit.emit_projectile("attack", "low");
	}
	
	if (_unit.data.current_command == "LOW BLOCK"){
		return _unit.emit_projectile("block", "low");
	}
	
	if (
		!obj_round_manager.is_menu_demo &&
		_unit.object_index == obj_player &&
		_unit.data.current_command != ""
	) audio_play_sound(snd_invalid_command, 100, false);
}