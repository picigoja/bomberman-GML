event_inherited();

if ai_movement_enabled {
	var _target = ai_get_target_coordinate(global.grid, path, x, y, id);
	if mp_grid_path(global.grid, path, x, y, _target[0], _target[1], false) {
		for (var i = 0; i < path_get_number(path); ++i) {
		    path_change_point(path, i, 
				round_to_tilesize_centered(path_get_point_x(path, i)),
				round_to_tilesize_centered(path_get_point_y(path, i)), 100);
		}
		ai_movement_enabled = false;
		path_start(path, SPEED_SLOW, path_action_stop, false);
	}
}
/*
var _xmov = path_get_x(path, path_position) - path_get_x(path, path_positionprevious);
var _ymov = path_get_y(path, path_position) - path_get_y(path, path_positionprevious);
if instance_exists(obj_explosion) {
	if point_distance(x + _xmov, y + _ymov, obj_explosion.x, obj_explosion.y) < TILE_SIZE {
		path_speed = 0;
	} else {
		path_speed = SPEED_SLOW;
	}
}
*/
if (ai_target_x = x and ai_target_y = y) {
	ai_movement_enabled = true;
}

if (path_position == 1) {
	x = round_to_tilesize_centered(x);
	y = round_to_tilesize_centered(y);
}