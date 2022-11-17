draw_set_color(c_lime);
draw_rectangle(	round_to_tilesize(mouse_x), 
				round_to_tilesize(mouse_y), 
				round_to_tilesize(mouse_x) + TILE_SIZE - 1, 
				round_to_tilesize(mouse_y) + TILE_SIZE - 1, true);
if instance_exists(obj_player_ai) {
	draw_path(obj_player_ai.path, x, y, true);
}
draw_set_color(c_white);