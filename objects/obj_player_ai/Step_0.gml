event_inherited();

if ai_movement_enabled {
	var _target = ai_get_target_coordinate(grid, path, x, y, id);
	if (x == _target[0] and y == _target[1]) {
		action = true;
		alarm_set(1, 5);
	} else {
		ai_target_x = _target[0];
		ai_target_y = _target[1];
	}
	
	if mp_grid_path(grid, path, x, y, ai_target_x, ai_target_y, false) {
		for (var i = 0; i < path_get_number(path); ++i) {
		    path_change_point(path, i, 
				round_to_tilesize_centered(path_get_point_x(path, i)),
				round_to_tilesize_centered(path_get_point_y(path, i)), 100);
		}
		ai_movement_enabled = false;
		path_start(path, SPEED_SLOW, path_action_stop, false);
	}
}

if (ai_target_x = x and ai_target_y = y) {
	ai_movement_enabled = true;
}

if (path_position == 1) {
	x = round_to_tilesize_centered(x);
	y = round_to_tilesize_centered(y);
}