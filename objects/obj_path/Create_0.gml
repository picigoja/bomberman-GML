var _playground_h = 800;
var _playground_v = 800;

var _h_cells = _playground_h div TILE_SIZE;
var _v_cells = _playground_v div TILE_SIZE;

global.grid = mp_grid_create(0, 0, _h_cells, _v_cells, TILE_SIZE, TILE_SIZE);
mp_grid_add_instances(global.grid, obj_wall_parent, true);

depth = -99;