if (!obj_tround_manager.is_menu_demo){
	draw_set_color(c_white);
	draw_set_font(fnt_default_big);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text(x, y - 32, "Round " + string(obj_tround_manager.current_round));
	draw_text(x, y - 96, "Tround " + string(obj_run_manager.current_tround));
	draw_set_font(fnt_default);
}

draw_set_color(c_black);
draw_rectangle(x - rect_width_half, y - rect_height_half, x + rect_width_half, y + rect_height_half, false);

if (obj_tround_manager.current_phase != "play") return;

draw_set_color(c_red);
var _pct_complete = obj_tround_manager.alarm[0] / obj_tround_manager.get_play_phase_duration();
var _fill_width_half = rect_width_half * _pct_complete;
draw_rectangle(x - _fill_width_half, y - rect_height_half, x + _fill_width_half, y + rect_height_half, false);
