var _excluded_directions = ds_list_create();
for (var _i = 0; _i <= explosion_radius; ++_i) {
	for (var _dir = 0; _dir < 360; _dir += 90) {
		var _x = x + lengthdir_x(_i * TILE_SIZE, _dir);
		var _y = y + lengthdir_y(_i * TILE_SIZE, _dir);
		var _dir_not_in_excluded = (ds_list_find_index(_excluded_directions, _dir) = -1);
		if (((_i = 0 and _dir = 0) or _i > 0) and !place_meeting(_x, _y, obj_wall) and _dir_not_in_excluded) { 
			with instance_create_depth(_x, _y, depth + 1, obj_explosion) {
				image_direction = _dir;
				is_first_piece = bool(_i = 0);
				is_last_piece = bool(other.explosion_radius = _i);
			}
		}
		if (place_meeting(_x, _y, obj_wall)) {
			ds_list_add(_excluded_directions, _dir);
		}
	}
}
ds_list_destroy(_excluded_directions);
instance_destroy();