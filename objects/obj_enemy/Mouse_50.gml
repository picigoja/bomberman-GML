pathfider_x = round_to_tilesize(mouse_x) + TILE_SIZE / 2;
pathfider_y = round_to_tilesize(mouse_y) + TILE_SIZE / 2;

var _x = x + TILE_SIZE / 2;
var _y = y + TILE_SIZE / 2;

if (_x = round_to_tilesize(x) + TILE_SIZE / 2 and _y = round_to_tilesize(y) + TILE_SIZE / 2) {
	if (mp_grid_path(global.grid, path, _x, _y, pathfider_x, pathfider_y, false)) {
			path_start(path, TILE_SIZE / 16, path_action_stop, false);
	}
}