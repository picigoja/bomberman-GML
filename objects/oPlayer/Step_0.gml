var _right = keyboard_check(vk_right) or keyboard_check(ord("D"));
var _up = keyboard_check(vk_up) or keyboard_check(ord("W"));
var _left = keyboard_check(vk_left) or keyboard_check(ord("A"));
var _down = keyboard_check(vk_down) or keyboard_check(ord("S"));
var _action1 = keyboard_check(vk_space);

var _horizontal_movement = (_right - _left);
var _vertical_movement = (_down - _up);

#region // Movement
// Horizontal movement
if (!place_meeting(x + _horizontal_movement, y, oWall)) {
	x += _horizontal_movement * moving_speed;
} else {
	var _yto = y;
	var _ydis = TILE_SIZE * 2;
	for (var i = -1; i < 2; ++i) {
		var _ytocheck = round_to_tilesize(y) + i * TILE_SIZE;
		if (!place_meeting(x + _horizontal_movement * TILE_SIZE, _ytocheck, oWall) and _ydis > abs(y - _ytocheck)) {
			_ydis = abs(y - _ytocheck);
			_yto = _ytocheck;
		}
	}
	if (!place_meeting(x, y + sign(_yto - y), oWall)) {
		y += sign(_yto - y) * moving_speed * bool(_vertical_movement = 0);
	}
}

// Vertical movement
if (!place_meeting(x, y + _vertical_movement, oWall)) {
	y += _vertical_movement * moving_speed;
} else {
	var _xto = x;
	var _xdis = TILE_SIZE * 2;
	for (var i = -1; i < 2; ++i) {
		var _xtocheck = round_to_tilesize(x) + i * TILE_SIZE;
		if (!place_meeting(_xtocheck, y + _vertical_movement * TILE_SIZE, oWall) and _xdis > abs(x - _xtocheck)) {
			_xdis = abs(x - _xtocheck);
			_xto = _xtocheck;
		}
	}
	if (!place_meeting(x + sign(_xto - x), y, oWall)) {
		x += sign(_xto - x) * moving_speed * bool(_horizontal_movement = 0);
	}
}
#endregion

#region // Action 1

if (_action1 and action1_enabled) {
	action1_enabled = false;
	alarm_set(0, action1_timer);
	with instance_create_depth(round_to_tilesize(x), round_to_tilesize(y), depth, oBomb) {
		bomb_timer = other.bomb_timer;
		explosion_radius = other.explosion_radius;
	}
}

#endregion