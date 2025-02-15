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
		// toggle if unit can be trained or not
		if (global.enemy_3_can_train_kn == true){
			// set it to false
			global.enemy_3_can_train_kn = false;
			but_sprite_darken_opacity = 0.5;
		}
		else {
			// set it to true
			global.enemy_3_can_train_kn = true;
			but_sprite_darken_opacity = 0;
		}
		
			

	}

}