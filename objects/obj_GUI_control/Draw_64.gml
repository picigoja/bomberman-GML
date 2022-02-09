draw_rectangle_color(sidepanel_x, sidepanel_y, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
if (instance_number(obj_player) > 0) {
	draw_text(sidepanel_x + 32, sidepanel_y + 32, "Shield: " + string(obj_player.shields));
}