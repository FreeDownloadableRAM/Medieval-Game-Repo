// Pause Wrapper (DON'T run anything if the game state is paused...)
if (global.is_game_paused == true){
	// Do Nothing
	

}
else{
	// So game isnt paused, what do we do when hit?
	// The type of attack hitting us is determined from the events tab, so we dont have to
	// account for it here
	character_health -= (global.arbalest_atk - (global.arbalest_atk * character_pierce_defence));
	// If health drops below zero or is zero, destroy this instance, in the case of a soldier NPC
	// We spaw a "dead" version of it that plays an animation and stays there for x amount of time so
	// AI doesnt target it
	if (character_health <= 0){
		instance_destroy();
		// global.player_unit_count_enemy -= 1; // migrated to dead character object
		// update unit count for formations
		
		//spawn dead character
		instance_create_layer(x,y,"NPCs",death_character);
		
	}


}