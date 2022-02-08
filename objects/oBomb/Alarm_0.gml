for (var i = 0; i <= explosion_radius; ++i) {
	for (var dir = 0; dir < 360; dir += 90) {
		var _x = x + lengthdir_x(i * TILE_SIZE, dir);
		var _y = y + lengthdir_y(i * TILE_SIZE, dir);
		if (((i = 0 and dir = 0) or i > 0) and !place_meeting(_x, _y, oWall)) { 
			with instance_create_depth(_x, _y, depth, oExplosion) {
				image_direction = dir;
				is_first_piece = bool(i = 0);
				is_last_piece = bool(other.explosion_radius = i);
			}
		}
	}
}
instance_destroy();