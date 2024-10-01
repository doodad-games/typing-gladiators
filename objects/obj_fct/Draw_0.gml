draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(remaining_duration / duration);
draw_text(x, y, text);
draw_set_alpha(1);