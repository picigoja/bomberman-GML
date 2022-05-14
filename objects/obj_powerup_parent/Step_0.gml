if (place_meeting(x, y, obj_player)) {
	instance_destroy();
}

var _exp = instance_place(x, y, obj_explosion),
if (_exp != noone and ds_list_find_index(explosions_list, _exp) = -1) {
	explosion_counter--;
	ds_list_add(explosions_list, _exp);
}

if (explosion_counter <= 0) instance_destroy();