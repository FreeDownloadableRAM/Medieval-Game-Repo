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
		// if we are retr but
		if (ai_ordr_chck == 0){
			global.player_order = 0;
		
		}
		else if (ai_ordr_chck == 1){
			global.player_order = 1;
		
		}
		else{
			global.player_order = 2;
		
		}
		
	}

}

