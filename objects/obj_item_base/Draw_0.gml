draw_self();
draw_set_color(c_white);

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 128, item_data.display_name);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(x - 172, y + 128, get_item_description(item_data));