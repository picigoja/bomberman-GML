event_inherited();

var _right =	keyboard_check(vk_right)				and player_id = 0
			or	keyboard_check(ord("D"))				and player_id = 1 
			or	gamepad_axis_value(0, gp_axislh) > .5	and player_id = 2
			or	gamepad_axis_value(1, gp_axislh) > .5	and player_id = 3;
			
var _up =		keyboard_check(vk_up)					and player_id = 0 
			or  keyboard_check(ord("W"))				and player_id = 1
			or  gamepad_axis_value(0, gp_axislv) < -.5	and player_id = 2
			or  gamepad_axis_value(1, gp_axislv) < -.5	and player_id = 3;
			
var _left =		keyboard_check(vk_left)					and player_id = 0 
			or  keyboard_check(ord("A"))				and player_id = 1
			or  gamepad_axis_value(0, gp_axislh) < -.5	and player_id = 2
			or  gamepad_axis_value(1, gp_axislh) < -.5	and player_id = 3;
			
var _down =		keyboard_check(vk_down)					and player_id = 0 
			or  keyboard_check(ord("S"))				and player_id = 1
			or  gamepad_axis_value(0, gp_axislv) > .5	and player_id = 2
			or  gamepad_axis_value(1, gp_axislv) > .5	and player_id = 3;
			
action =		keyboard_check(vk_numpad0)				and player_id = 0
			or  keyboard_check(vk_space)				and player_id = 1
			or  gamepad_button_check(0, gp_face1)		and player_id = 2
			or  gamepad_button_check(1, gp_face1)		and player_id = 3;
	
var _horizontal_movement = (_right - _left);
var _vertical_movement = (_down - _up);

#region Movement

var _movement_restrictor = obj_wall_parent;

// Horizontal movement
if (!place_meeting(x + _horizontal_movement, y, _movement_restrictor)) {
	x += _horizontal_movement * movement_speed;
} else {
	var _yto = y;
	var _ydis = TILE_SIZE;
	for (var i = -1; i < 2; ++i) {
		var _ytocheck = round_to_tilesize(y) + i * TILE_SIZE + TILE_SIZE * .5;
		if (!place_meeting(x + _horizontal_movement, _ytocheck, _movement_restrictor) and _ydis >= abs(y - _ytocheck)) {
			_ydis = abs(y - _ytocheck);
			_yto = _ytocheck;
		}
	}
	if !place_meeting(x + _horizontal_movement, _yto, _movement_restrictor) {
		y += sign(_yto - y) * movement_speed * bool(_vertical_movement = 0);
	}
}

// Vertical movement
if (!place_meeting(x, y + _vertical_movement, _movement_restrictor)) {
	y += _vertical_movement * movement_speed;
} else {
	var _xto = x;
	var _xdis = TILE_SIZE;
	for (var i = -1; i < 2; ++i) {
		var _xtocheck = round_to_tilesize(x) + i * TILE_SIZE + TILE_SIZE * .5;
		//xdraw = _xtocheck;
		if (!place_meeting(_xtocheck, y + _vertical_movement, _movement_restrictor) and _xdis >= abs(x - _xtocheck)) {
			_xdis = abs(x - _xtocheck);
			_xto = _xtocheck;
		}
	}
	if (!place_meeting(_xto, y + _vertical_movement, _movement_restrictor)) {
	x += sign(_xto - x) * movement_speed * bool(_horizontal_movement = 0);
	}
}

#endregion