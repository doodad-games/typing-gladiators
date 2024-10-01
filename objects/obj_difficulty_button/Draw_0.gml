draw_self();

var _duration = frame_duration_to_display_string(base_turn_duration);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, config.display_name + " (" + string(_duration) + "s)");