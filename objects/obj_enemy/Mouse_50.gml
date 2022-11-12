pathfider_x = round_to_tilesize_centered(mouse_x);
pathfider_y = round_to_tilesize_centered(mouse_y);

if (x = round_to_tilesize_centered(x) and y = round_to_tilesize_centered(y)) {
	if (mp_grid_path(global.grid, path, x, y, pathfider_x, pathfider_y, false)) {
		for (var i = 0; i < path_get_number(path); ++i;) {
			var _px = round_to_tilesize_centered(path_get_point_x(path, i));
			var _py = round_to_tilesize_centered(path_get_point_y(path, i));
			path_change_point(path, i, _px, _py, 100);
		}
		path_start(path, SPEED_SLOW, path_action_stop, false);
	}
}