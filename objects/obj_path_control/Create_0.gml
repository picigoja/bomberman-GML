global.grid = mp_grid_create(0, 0, CELLS, CELLS, TILE_SIZE, TILE_SIZE);
mp_grid_add_instances(global.grid, obj_wall_parent, true);