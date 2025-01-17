/// This is logic for when we click things
// We want to check if the game is paused first, if not, assume normal gameplay logic.
// Since we do not have a pause state implemented, just assume we are not

// If the game is paused only run this code

if (global.is_game_paused == true){

	// No pause menu implementation yet...

}
// If we are in a menu
else if (global.is_player_in_menu == true){

}
// If we aren't in a menu or pause screen, we are gamin' baby!
else {
	
	// Now that we confirmed it is a valid spot to click...
	// Check if the enemy object exists
	if (instance_exists(obj_dbg_enemy)) {
		// it does
		// check if we clicked on an attack target
		if (place_meeting(x,y,obj_dbg_enemy)){
			// mark target for attack
		}
		else {
			// mark target for movement
			//instance_create_layer(new_x_position,new_y_position,"Targets",obj_player_move_target);
			if(instance_exists(obj_player_move_target)){
				
				
				//obj_player_move_target.x = new_x_position;
				//obj_player_move_target.y = new_y_position;
			}
			else {
			
			}
			
		}
	}
	else {
	// It doesnt
	// so just create a move target
		//instance_create_layer(new_x_position,new_y_position,"Targets",obj_player_move_target);
		if(instance_exists(obj_player_move_target)){
				
				
			//obj_player_move_target.x = new_x_position;
			//obj_player_move_target.y = new_y_position;
		}
		else {
			
		}
			
	}
	
}

