draw_set_color(c_black);
draw_rectangle(x - 384, y - 240, x + 384, y + 240, false);

draw_set_color(c_white);
draw_set_font(fnt_default_big);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(x, y - 200, "Game Over");
draw_set_font(fnt_default);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
var _text = "Round: " + string(obj_run_manager.current_round) + "\n";
_text += "Speed:  " + duration_in_frames_to_display_string(obj_run_manager.base_turn_duration) + "\n";

if (obj_run_manager.difficulty != "custom"){
	if (obj_run_manager.did_beat_highscore) _text += "HIGHSCORE!";
	else _text += "Best:   " + string(obj_run_manager.current_highscore);
}

draw_text(x - 288, y + 48, _text);