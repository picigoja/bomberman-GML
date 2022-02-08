switch (moving_direction) {
	
	case 0:
		if (!place_meeting(x + moving_speed, y, oWall) and moving_distance > 0) {
			x += moving_speed;
			moving_distance -= moving_speed;
		}
	break;
		
	case 90:
		if (!place_meeting(x, y + moving_speed, oWall) and moving_distance > 0) {
			y += moving_speed;
			moving_distance -= moving_speed;
		}
	break;
		
	case 180:
		if (!place_meeting(x - moving_speed, y, oWall) and moving_distance > 0) {
			x -= moving_speed;
			moving_distance -= moving_speed;
		}
	break;
		
	case 270:
		if (!place_meeting(x, y - moving_speed, oWall) and moving_distance > 0) {
			y -= moving_speed;
			moving_distance -= moving_speed;
		}
	break;
}

if (moving_distance <= 0) {
	if (radius > 0) {
		var _explosion = instance_create_layer(x, y, "Instances", oExplosion);
		_explosion.radius = radius - 1;
		_explosion.moving_direction = moving_direction;
		_explosion.parent = object_get_parent(id);
		ds_stack_push(self.parent.explosion_instances, id);
		radius--;
	}
}