#region Action 1

if (action1 and action1_enabled) {
	action1_enabled = false;
	alarm_set(0, action1_timer);
	with instance_create_depth(round_to_tilesize(x + TILE_SIZE / 2), round_to_tilesize(y + TILE_SIZE / 2), depth, obj_bomb) {
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