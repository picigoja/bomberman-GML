event_inherited();
action = position_meeting(mouse_x, mouse_y, self) and mouse_check_button_pressed(mb_right);
if (path_position = 1) {
	path_clear_points(path);
	x = round_to_tilesize(x) + TILE_SIZE * .5;
	y = round_to_tilesize(y) + TILE_SIZE * .5;
}