draw_rectangle_color(sidepanel_x, sidepanel_y, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
if (instance_number(obj_player) > 0 and instance_number(obj_enemy) > 0) {
	draw_sprite_ext(spr_player, 0, sidepanel_x + 32, sidepanel_y + 148, .5, .5, image_angle, image_blend, image_alpha);
	draw_text(sidepanel_x + 64, sidepanel_y + 132, "Shield: " + string(obj_player.shields));
	draw_text(sidepanel_x + 64, sidepanel_y + 148, "Timer: " + string(obj_player.bomb_timer));
	draw_text(sidepanel_x + 64, sidepanel_y + 164, "Radius: " + string(obj_player.explosion_radius));
	draw_text(sidepanel_x, sidepanel_y + 180, "Ex: " + string(obj_enemy.x));
	draw_text(sidepanel_x + 100, sidepanel_y + 180, "Ey: " + string(obj_enemy.y));
}