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
var _text = "Tround: " + string(obj_run_manager.current_tround) + "\n";
_text += "Speed:  " + string(frame_duration_to_display_string(obj_run_manager.base_turn_duration)) + "s\n";
_text += "Best:   " + "TODO";
draw_text(x - 288, y + 48, _text);