if (place_meeting(x, y, obj_explosion)) {
	if random(100) > POWERUP_DROP_PERCENTAGE {
		instance_create_depth(x, y, depth - 1, obj_powerup);
	}
	with(obj_player_ai) {
		mp_grid_clear_cell(global.grid, other.x div TILE_SIZE, other.y div TILE_SIZE);
	}
	instance_destroy();
}