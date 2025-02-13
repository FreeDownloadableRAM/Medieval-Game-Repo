/// whenever left mouse button is clicked we run this code
// first we check, is the mouse on top of this object?
if (global.is_game_paused == true){
	// Game is paused, do nothing

}
else {
	// Game is not paused, do as you wish
	// Count down the unit train timer
	if (mouse_x < (x + button_width_from_center + 1) && mouse_x > (x - button_width_from_center - 1)
			&& mouse_y < (y + button_height_from_center + 1) && mouse_y > (y - button_height_from_center - 1)){
		
		// We are within button bounds and we clicked
		// increment our slot colour by 1
		if(global.slot_four_colour < 7){
			global.slot_four_colour ++;
			
		
		}
		// bring it back to zero if we are about to go above palette size
		else {
			global.slot_four_colour = 0;
			
		}
		// update our own sprite
		colour_palette_index = global.slot_four_colour;

	}

}