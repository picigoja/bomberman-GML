if (place_meeting(x, y, obj_explosion)) {
	instance_create_depth(x, y, depth - 1, obj_pickup_shield);
	instance_destroy();
}