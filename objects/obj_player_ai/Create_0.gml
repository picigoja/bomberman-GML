event_inherited();
image_index = floor(random(3));

ai_movement_enabled = true;

grid = mp_grid_create(0, 0, 800 div TILE_SIZE, 800 div TILE_SIZE, TILE_SIZE, TILE_SIZE);
mp_grid_add_instances(grid, obj_wall_parent, true);

path = path_add();

ai_target_x = x;
ai_target_y = y;