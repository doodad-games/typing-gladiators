global.shop_items = ["", "", ""];
global.shop_item_choices = [];
array_copy(global.shop_item_choices, 0, global.item_ids, 0, array_length(global.item_ids));

function generate_shop_items(){
	array_shuffle_ext(global.shop_item_choices);
	global.shop_items[0] = global.shop_item_choices[0];
	global.shop_items[1] = global.shop_item_choices[1];
	global.shop_items[2] = global.shop_item_choices[2];
}