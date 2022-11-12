if (place_meeting(x, y, obj_explosion)) {
	if random(100) > POWERUP_DROP_PERCENTAGE {
		instance_create_depth(x, y, depth - 1, obj_powerup);
	}
	mp_grid_clear_cell(global.grid, x div TILE_SIZE, y div TILE_SIZE);
	instance_destroy();
}