if (place_meeting(x, y, obj_explosion)) {
	instance_create_depth(x, y, depth - 1, powerup_list[random(array_length(powerup_list))]);
	mp_grid_clear_cell(global.grid, x div TILE_SIZE, y div TILE_SIZE);
	instance_destroy();
}