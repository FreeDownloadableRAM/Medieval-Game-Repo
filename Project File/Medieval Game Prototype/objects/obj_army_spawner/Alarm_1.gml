// spawn
if (global.is_game_paused == true){
	// do not run

}
else {
	
	random_spawn_delay = irandom_range(1,30);
	
	// If not paused, run
	// Dont over populate
	if (global.player_unit_count < 25){
		// Generate random number
		blue_spawn_index = irandom_range(1,7);
		
		// Spawn corresponding units
		if (blue_spawn_index == 1){
			instance_create_layer(spawn_location_x, spawn_location_y,"NPCs",sm);
			// Update
			//global.player_unit_count ++;
			
		}
		else if (blue_spawn_index == 2){
			instance_create_layer(spawn_location_x, spawn_location_y,"NPCs",pm);
			// Update
			//global.player_unit_count ++;
			
		}
		else if (blue_spawn_index == 3){
			instance_create_layer(spawn_location_x, spawn_location_y,"NPCs",rg);
			// Update
			//global.player_unit_count ++;
			
		}
		else if (blue_spawn_index == 4){
			instance_create_layer(spawn_location_x, spawn_location_y,"NPCs",kn);
			// Update
			//global.player_unit_count ++;
			
		}
		else if (blue_spawn_index == 5){
			instance_create_layer(spawn_location_x, spawn_location_y,"NPCs",ab);
			// Update
			//global.player_unit_count ++;
			
		}
		else if (blue_spawn_index == 6){
			instance_create_layer(spawn_location_x, spawn_location_y,"NPCs",hb);
			// Update
			//global.player_unit_count ++;
			
		}
		else {
			instance_create_layer(spawn_location_x, spawn_location_y,"NPCs",mg);
			// Update
			//global.player_unit_count ++;
			
		}
		
	}
	
	// Enemy
	if (global.player_unit_count_enemy < 25){
		// Generate what units to spawn
		red_spawn_index = irandom_range(1,7);
		
		
		
		// Spawn corresponding units
		if (red_spawn_index == 1){
			instance_create_layer(spawn_location_x_enemy, spawn_location_y_enemy,"NPCs",sm_enemy);
			// Update
			//global.player_unit_count_enemy ++;
			
		}
		else if (red_spawn_index == 2){
			instance_create_layer(spawn_location_x_enemy, spawn_location_y_enemy,"NPCs",pm_enemy);
			// Update
			//global.player_unit_count_enemy ++;
			
		}
		else if (red_spawn_index == 3){
			instance_create_layer(spawn_location_x_enemy, spawn_location_y_enemy,"NPCs",rg_enemy);
			// Update
			//global.player_unit_count_enemy ++;
			
		}
		else if (red_spawn_index == 4){
			instance_create_layer(spawn_location_x_enemy, spawn_location_y_enemy,"NPCs",kn_enemy);
			// Update
			//global.player_unit_count_enemy ++;
			
		}
		else if (red_spawn_index == 5){
			instance_create_layer(spawn_location_x_enemy, spawn_location_y_enemy,"NPCs",ab_enemy);
			// Update
			//global.player_unit_count_enemy ++;
			
		}
		else if (red_spawn_index == 6){
			instance_create_layer(spawn_location_x_enemy, spawn_location_y_enemy,"NPCs",hb_enemy);
			// Update
			//global.player_unit_count_enemy ++;
			
		}
		else {
			instance_create_layer(spawn_location_x_enemy, spawn_location_y_enemy,"NPCs",mg_enemy);
			// Update
			//global.player_unit_count_enemy ++;
			
		}
		
	}
	
	alarm_set(1,random_spawn_delay);

}


