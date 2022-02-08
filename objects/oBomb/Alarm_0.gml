visible = false;
for (var i = 0; i < 4; i++) {
    var _explosion = instance_create_layer(x, y, "Instances", oExplosion);
	_explosion.moving_direction = 90 * i;
	_explosion.radius = explosion_radius - 1;
	_explosion.parent = id;
	ds_stack_push(explosion_instances, id);
}