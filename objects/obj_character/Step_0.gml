#region Action

if (action and action_enabled) {
	action_enabled = false;
	alarm_set(0, action_timer);
	instance_create_depth(round_to_tilesize(x) + TILE_SIZE * .5, round_to_tilesize(y) + TILE_SIZE * .5, depth, obj_bomb, {
		bomb_timer : other.bomb_timer,
		explosion_radius : other.explosion_radius
	});
}

#endregion

#region Explosion and shield handling

var _exp = instance_place(x, y, obj_explosion),
if (_exp != noone and ds_list_find_index(explosions_list, _exp) = -1) {
	if (_exp.percentage <= EXPLOSION_EFFECT_TRESHOLD) {
		shields--;
		ds_list_add(explosions_list, _exp);
	}
	
}
if (shields <= 0) instance_destroy();

#endregion

action_timer = clamp(action_timer, MIN_ACTION_TIMER, MAX_ACTION_TIMER);
bomb_timer = clamp(bomb_timer, MIN_BOMB_TIMER, MAX_BOMB_TIMER);