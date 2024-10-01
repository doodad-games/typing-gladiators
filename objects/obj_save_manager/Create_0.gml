function write_save(){
	ini_open("save_data");
	
	ini_write_string("main", "last_selected_difficulty", last_selected_difficulty);
	ini_write_real("main", "last_custom_duration", last_custom_duration);
	
	ini_close();
}

ini_open("save_data");

last_selected_difficulty = ini_read_string("main", "last_selected_difficulty", "medium");
last_custom_duration = ini_read_real("main", "last_custom_duration", 240);

ini_close();