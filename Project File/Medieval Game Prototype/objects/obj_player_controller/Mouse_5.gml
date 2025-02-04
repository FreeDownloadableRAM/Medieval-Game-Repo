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
	
	// check if we are in debug mode
	if (global.dev_mode == true){
		// Right click will have the following effect
		// Create a enemy obj
		//instance_create_layer(x,global.spawn_height,"NPCs",obj_arbalest_a1);

		//global.player_unit_count = global.player_unit_count + 1;
	}
	else {
		// nothing
		instance_create_layer(x,global.spawn_height,"NPCs",obj_arbalest_a1);
		instance_create_layer(x,global.spawn_height,"NPCs",obj_arbalest_a2);
		instance_create_layer(x,global.spawn_height,"NPCs",obj_arbalest_a3);
	
	}
	
	
	
}

