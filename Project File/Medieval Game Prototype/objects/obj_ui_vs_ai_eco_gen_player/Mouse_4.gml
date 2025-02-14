/// whenever left mouse button is clicked we run this code
// first we check, is the mouse on top of this object?
if (global.is_game_paused == true){
	// Game is paused, do nothing

}
else {
	// Game is not paused, do as you wish
	
	// Count down the unit train timer
	
	
	if ((mouse_x < (x + ((button_width_from_center + 16) * button_scale_x) )) && (mouse_x > (x - (button_width_from_center * button_scale_x)))
		&& (mouse_y < (y + button_height_from_center)) && (mouse_y > (y - button_height_from_center))){
		
		// We are within button bounds and we clicked
		if (global.slot_one_eco_gen_multiplier < 9){
			// increment up by one
			global.slot_one_eco_gen_multiplier ++;
		
		}
		else {
			// reset back to one
			global.slot_one_eco_gen_multiplier = 1;
		
		}
		// update internal multiplier value
		number_value = global.slot_one_eco_gen_multiplier;
			

	}

}