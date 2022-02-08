var _bomb_timer = 10;
alarm_set(0, _bomb_timer);
explosion_radius = 2;

explosion_instances = ds_stack_create();
ds_stack_push(explosion_instances, id);

for (var i = 0; i < ds_stack_size(explosion_instances); ++i) {
	instance_destroy(ds_stack_pop(explosion_instances));
}
ds_stack_destroy(explosion_instances);