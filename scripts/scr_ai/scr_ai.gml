function ai_get_free_cells(_grid, _path, _x, _y) {
	var _cells_number = 800 div TILE_SIZE;
	var _valid_cells = ds_list_create();
	for (var j = 1; j < _cells_number - 1; ++j) {
	    for (var i = 1; i < _cells_number - 1; ++i) {
			var _xto = round_to_tilesize_centered(i * TILE_SIZE);
			var _yto = round_to_tilesize_centered(j * TILE_SIZE);
			if mp_grid_path(_grid, _path, _x, _y, _xto, _yto, false) {
				ds_list_add(_valid_cells, [_xto, _yto, 0]);
			}
		}
	}
	return _valid_cells;
}

function ai_evaluate_valid_cell(_cell, _id) {
	var _x = _cell[0];
	var _y = _cell[1];
	var _instance_count = 0;
	with (obj_box) {
		if (point_distance(x, y, _x, _y) <= TILE_SIZE + 1) {
			_instance_count++;
		}
	}
	
	var _pwrup = instance_position(_x, _y, obj_powerup);
	var _pwrup_value = 0;
	if _pwrup != noone {
		_pwrup_value = 2 + bool(_pwrup.variant < 2) * 5;
	}
	
	
	return _instance_count + _pwrup_value - ai_check_bomb_proximity(_x, _y) * MOD_BOMB_PROXIMITY;
}

function instance_nearest_except_self(_x, _y, _obj, _id) {
	var _distance = 9999;
	var _nearest_instance = noone;
	if instance_exists(_obj) {
		with (_obj) {
			if self != _id {
				if point_distance(_x, _y, x, y) < _distance {
					_nearest_instance = id;
				}
			}
		}
	}
	return _nearest_instance;
}
	
function ai_get_highest_value_cell(_cells) {
	var _max_value = 0;
	var _index = 0;
	for (var i = 0; i < ds_list_size(_cells); ++i) {
		if _cells[| i][2] > _max_value {
			_max_value = _cells[| i][2];
			_index = i;
		}
	}
	var _coords = _cells[| _index];
	ds_list_destroy(_cells);
	return _coords;
}
	
function ai_get_target_coordinate(_grid, _path, _x, _y, _id) {
	var _cells = ai_get_free_cells(_grid, _path, _x, _y);
	for (var i = 0; i < ds_list_size(_cells); ++i) {
		_cells[| i][2] = ai_evaluate_valid_cell(_cells[| i], _id);
	}
	return ai_get_highest_value_cell(_cells);
}
	
function ai_check_bomb_proximity(_x, _y) {
	for (var dir = 0; dir < 360; dir += 90) {
		for (var dist = 0; dist < CELLS; ++dist) {
			
			var _bomb_in_proximity = instance_place(_x + lengthdir_x(dist * TILE_SIZE, dir), _y + lengthdir_y(dist * TILE_SIZE, dir), obj_bomb);
			if _bomb_in_proximity != noone {
				if (point_direction(_x, _y, _bomb_in_proximity.x, _bomb_in_proximity.y) <= _bomb_in_proximity.explosion_radius * TILE_SIZE) {
					return true;	
				}
			}
			
			var _expl_in_proximity = instance_place(_x + lengthdir_x(dist * TILE_SIZE, dir), _y + lengthdir_y(dist * TILE_SIZE, dir), obj_explosion)
			if _expl_in_proximity != noone {
				return true;	
			}
			
			if place_meeting(lengthdir_x(dist * TILE_SIZE, dir), lengthdir_y(dist * TILE_SIZE, dir), obj_wall) {
				dist = CELLS;
			}
		}
	}
	return false;
}