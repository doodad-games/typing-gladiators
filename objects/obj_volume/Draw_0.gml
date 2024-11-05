draw_self();

var _volume = string(round(obj_save_manager.get_volume(type) * 100)) + "%";

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, label + ": " + _volume);

if (type != "master") return;

draw_set_valign(fa_bottom);
draw_text(x, y - 48, "Volume");