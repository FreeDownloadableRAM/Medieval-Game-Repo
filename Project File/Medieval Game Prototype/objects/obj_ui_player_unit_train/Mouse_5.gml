/// @description toggle auto train
// here we just toggle auto trainer
// whenever right mouse button is clicked we run this code
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
		// turn on auto trainer if it is already off
		if (auto_train == false){
			auto_train = true;
		
		}
		// train auto trainer off if already on
		else {
			auto_train = false;
		
		}
			

	}

}
