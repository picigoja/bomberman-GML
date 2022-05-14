image_direction = 0;
is_first_piece = false;
is_last_piece = false;

image_speed = 0;
img_index = (!is_first_piece and !is_last_piece) + 2 * is_last_piece;
crv_value = 1;
curve = animcurve_get_channel(crv_explosion, 0);
percentage = 0;