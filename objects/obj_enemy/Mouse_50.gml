pathfider_x = round_to_tilesize(mouse_x) + TILE_SIZE / 2;
pathfider_y = round_to_tilesize(mouse_y) + TILE_SIZE / 2;

var _x = x + TILE_SIZE / 2;
var _y = y + TILE_SIZE / 2;

if (_x = round_to_tilesize(x) + TILE_SIZE / 2 and _y = round_to_tilesize(y) + TILE_SIZE / 2) {
	if (mp_grid_path(global.grid, path, _x, _y, pathfider_x, pathfider_y, false)) {
		for (var i = 0; i < path_get_number(path); ++i;) {
			var _px = round_to_tilesize(path_get_point_x(path, i)) + TILE_SIZE / 2;
			var _py = round_to_tilesize(path_get_point_y(path, i)) + TILE_SIZE / 2;
			path_change_point(path, i, _px, _py, 100);
		}
		path_start(path, TILE_SIZE / 16, path_action_stop, false);
	}
}