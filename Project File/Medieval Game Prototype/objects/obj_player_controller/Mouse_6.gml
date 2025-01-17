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
	
	// only available if we are in debug
	if (global.dev_mode == true){
		// Create a enemy obj
		//global.player_unit_count += 10;
		instance_create_layer(x,672,"Targets",obj_catapult); // 672 base, - 84 for proj catapult
		
		
	}


}
