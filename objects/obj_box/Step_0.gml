if (place_meeting(x, y, obj_explosion)) {
	instance_create_depth(x, y, depth - 1, powerup_list[random(array_length(powerup_list))]);
	instance_destroy();
}