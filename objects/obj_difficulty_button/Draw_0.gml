draw_self();

var _duration = duration_in_frames_to_display_string(base_turn_duration);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, config.display_name + " (" + _duration + ")");

if (difficulty == "custom"){
	draw_set_valign(fa_bottom);
	draw_text(x, y - 84, "Farthest: " + string(farthest_highscore) + " @ " + duration_in_frames_to_display_string(farthest_base_turn_duration));
	draw_text(x, y - 48, "Fastest: " + string(fastest_highscore) + " @ " + duration_in_frames_to_display_string(fastest_base_turn_duration));
} else {
	draw_set_valign(fa_bottom);
	draw_text(x, y - 48, "Best: " + string(highscore));
}