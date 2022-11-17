image_speed = 0;

explosion_counter = 2;
explosions_list = ds_list_create();

powerup_variants = ["shield", 
					"explosion_radius_up",
					"bomb_timer_up",
					"bomb_timer_down",
					"action_timer_up",
					"action_timer_down",
					"haste"];
			
variant = floor(random(array_length(powerup_variants)));
image_index = variant;