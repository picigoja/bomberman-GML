draw_rectangle_color(1200, 0, view_get_wport(view_camera[0]), view_get_hport(view_camera[0]), c_black, c_black, c_black, c_black, false);

var _spx = x * viewport_to_camera_ratio;
var _spy = y;
var _block_height = 64;

for (var i = 0; i < instance_number(obj_character); i++) {
	draw_sprite_ext(spr_player, i, _spx, _spy + i * _block_height, .5, .5, image_angle, image_blend, image_alpha)
}