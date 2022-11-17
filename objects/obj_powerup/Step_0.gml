with instance_place(x, y, obj_character) {
	instance_destroy(other);
	switch (other.powerup_variants[other.variant]) {
		case "shield":
			shields++;
		break;
		case "explosion_radius_up":
			explosion_radius++;
		break;
		case "bomb_timer_up":
			bomb_timer += BOMB_TIMER_MODIFIER;
		break;
		case "bomb_timer_down":
			bomb_timer -= BOMB_TIMER_MODIFIER;
		break;
		case "action_timer_up":
			action_timer += ACTION_TIMER_MODIFIER;
		break;
		case "action_timer_down":
			action_timer -= ACTION_TIMER_MODIFIER;
		break;
		case "haste":
			movement_speed = SPEED_FAST;
		break;
	}
}

var _exp = instance_place(x, y, obj_explosion);
if (_exp != noone and ds_list_find_index(explosions_list, _exp) = -1) {
	explosion_counter--;
	ds_list_add(explosions_list, _exp);
}

if (explosion_counter <= 0) instance_destroy();