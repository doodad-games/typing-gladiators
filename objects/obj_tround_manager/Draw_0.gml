draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for (var _i = 0; _i != global.cfg_commands_count; ++_i){
	draw_text(x, y + _i * 32, global.cfg_commands[_i]);
}