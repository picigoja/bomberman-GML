image_speed = 0;

explosion_counter = 2;
explosions_list = ds_list_create();

powerup_variants = ds_list_create();
ds_list_add(powerup_variants, 
			"shield", 
			"explosion_radius_up",
			"bomb_timer_up",
			"bomb_timer_down",
			"action_timer_up",
			"action_timer_down",
			"haste");
			
variant = ds_list_find_value(powerup_variants, random(ds_list_size(powerup_variants)));
image_index = ds_list_find_index(powerup_variants, variant);