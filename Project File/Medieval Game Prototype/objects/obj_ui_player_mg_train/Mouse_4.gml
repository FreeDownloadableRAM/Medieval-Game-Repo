/// whenever left mouse button is clicked we run this code
// first we check, is the mouse on top of this object?
if (global.is_game_paused == true){
	// Game is paused, do nothing

}
else {
	// Game is not paused, do as you wish
	
	// Count down the unit train timer
	
	
	if (mouse_x < (x + icon_width + 1) && mouse_x > (x - icon_width - 1)
			&& mouse_y < (y + icon_height + 1) && mouse_y > (y - icon_height - 1)){
		
		// We are within icon bounds
		// Now check if we are below or above population limit
		if (global.player_unit_count < global.player_unit_cap && unit_train_timer < 1 && global.player_gold_amount > (unit_train_cost - 1)){
	
			// We are below, you may create units
			instance_create_layer(unit_spawn_location_x,unit_spawn_location_y,"NPCs",unit_train_type);
			// create ui element to show that this unit is on cool down
			var _inst = instance_create_layer(x,y,"UI_elements_overlay",unit_train_cd_object);
			with (_inst){
		
				image_speed = 60/1200;
				//image_alpha = 0.5;
				cd_timer = 1200;
				cd_offset = 640;
					
			}
			
			// set internal timer to unit train time
			unit_train_timer = unit_train_time; // Still work in progress
			
			// charge Resources
			//global.player_unit_count += 1;
			global.player_gold_amount = global.player_gold_amount - unit_train_cost;
			
	
		}
		else {
			// We are not, do nothing 
			
		}
			

	}

}

