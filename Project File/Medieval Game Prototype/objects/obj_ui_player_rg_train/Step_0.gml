// run timers
if (global.is_game_paused == true){
	// do not run

}
else {
	// Count down timers
	// Here we reset timers 
	if (unit_train_timer <= 0){
		// If it is zero, do not decrease the timer
		// if we are at zero, check if we are on auto train
		if (auto_train == true){
			// if we are, check if we have enough resources to spawn unit, and then reset timer.
			if (global.player_unit_count < global.player_unit_cap && unit_train_timer < 1 && global.player_gold_amount > (unit_train_cost - 1)){
	
				// We are below, you may create units
				instance_create_layer(unit_spawn_location_x,unit_spawn_location_y,"NPCs",unit_train_type);
				// create ui element to show that this unit is on cool down
				var _inst = instance_create_layer(x,y,"UI_elements_overlay",unit_train_cd_object);
				with (_inst){
		
					image_speed = 60/420;
					//image_alpha = 0.5;
					cd_timer = 420;
					cd_offset = 256;
					
					
				}
			
				// set internal timer to unit train time
				unit_train_timer = unit_train_time; // Still work in progress
			
				// charge Resources
				//global.player_unit_count += 1;
				global.player_gold_amount = global.player_gold_amount - unit_train_cost;
			
	
			}
		
		}

	}
	else {
		// if it is not zero, decrease the timer
		unit_train_timer = unit_train_timer - 1;

	}
	
	// Make unit icon follow camera
	x = camera_get_view_x(view_camera[0]) + unit_icon_placement_offset_x;
	
	// Destroy object if player castle heatlh is below 0 hp
	if (global.player_castle_health <= 0){
		// Destroy
		instance_destroy();
	
	}
	
	
	
}

