var _right = keyboard_check(vk_right) or keyboard_check(ord("D"));
var _up = keyboard_check(vk_up) or keyboard_check(ord("W"));
var _left = keyboard_check(vk_left) or keyboard_check(ord("A"));
var _down = keyboard_check(vk_down) or keyboard_check(ord("S"));
var _action1 = keyboard_check(vk_space);

var _horizontal_movement = (_right - _left);
var _vertical_movement = (_down - _up);
var _moving_speed = TILE_SIZE / 16;

#region Movement

var _movement_restrictor = obj_wall_parent;
// Horizontal movement
if (!place_meeting(x + _horizontal_movement, y, _movement_restrictor)) {
	x += _horizontal_movement * _moving_speed;
} else {
	var _yto = y;
	var _ydis = TILE_SIZE * 2;
	for (var i = -1; i < 2; ++i) {
		var _ytocheck = round_to_tilesize(y) + i * TILE_SIZE;
		if (!place_meeting(x + _horizontal_movement * TILE_SIZE, _ytocheck, _movement_restrictor) and _ydis > abs(y - _ytocheck)) {
			_ydis = abs(y - _ytocheck);
			_yto = _ytocheck;
		}
	}
	if (!place_meeting(x, y + sign(_yto - y), _movement_restrictor)) {
		y += sign(_yto - y) * _moving_speed * bool(_vertical_movement = 0);
	}
}

// Vertical movement
if (!place_meeting(x, y + _vertical_movement, _movement_restrictor)) {
	y += _vertical_movement * _moving_speed;
} else {
	var _xto = x;
	var _xdis = TILE_SIZE * 2;
	for (var i = -1; i < 2; ++i) {
		var _xtocheck = round_to_tilesize(x) + i * TILE_SIZE;
		if (!place_meeting(_xtocheck, y + _vertical_movement * TILE_SIZE, _movement_restrictor) and _xdis > abs(x - _xtocheck)) {
			_xdis = abs(x - _xtocheck);
			_xto = _xtocheck;
		}
	}
	if (!place_meeting(x + sign(_xto - x), y, _movement_restrictor)) {
		x += sign(_xto - x) * _moving_speed * bool(_horizontal_movement = 0);
	}
}

#endregion

#region Action 1

if (_action1 and action1_enabled) {
	action1_enabled = false;
	alarm_set(0, action1_timer);
	with instance_create_depth(round_to_tilesize(x), round_to_tilesize(y), depth, obj_bomb) {
		bomb_timer = other.bomb_timer;
		explosion_radius = other.explosion_radius;
	}
}

#endregion

#region Hit by explosion, Shiled handling

var _exp = instance_place(x, y, obj_explosion),
if (_exp != noone and ds_list_find_index(explosions_list, _exp) = -1) {
	if (_exp.percentage <= .5) {
		shields--;
		ds_list_add(explosions_list, _exp);
	}
	
}
if (shields <= 0) instance_destroy();

#endregion

#region Powerups

if (place_meeting(x, y, obj_powerup_shield)) shields++;
if (place_meeting(x, y, obj_powerup_expl)) explosion_radius++;
if (place_meeting(x, y, obj_powerup_cntrup)) bomb_timer += 10;
if (place_meeting(x, y, obj_powerup_cntrdown)) bomb_timer -= 10;
if (place_meeting(x, y, obj_powerup_placeup)) action1_timer += 10;
if (place_meeting(x, y, obj_powerup_placedown)) action1_timer -= 10;
if (place_meeting(x, y, obj_powerup_speed)) _moving_speed = _moving_speed;

#endregion