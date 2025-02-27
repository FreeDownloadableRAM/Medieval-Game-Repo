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
		// send us to corressponding level based on what map theme we chose.
		if (global.ai_vs_mode_map_theme = 0){
			// Forest
			room_goto(rm_vs_ai_forest);
		}
		// if we dont have anything, just go to forest as a default
		else {
			room_goto(rm_vs_ai_forest);
		}
		
			

	}

}