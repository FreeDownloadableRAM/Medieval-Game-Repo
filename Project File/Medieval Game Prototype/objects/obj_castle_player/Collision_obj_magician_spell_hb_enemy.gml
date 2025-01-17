// Pause Wrapper (DON'T run anything if the game state is paused...)
if (global.is_game_paused == true){
	// Do Nothing
	

}
else{
	// So game isnt paused, what do we do when hit?
	// The type of attack hitting us is determined from the events tab, so we dont have to
	// account for it here
	global.player_castle_health -= (global.magician_atk - (global.magician_atk * castle_magic_defence));
	castle_health = global.player_castle_health;
	// If health drops below zero or is zero, destroy this instance, in the case of a soldier NPC
	// We spaw a "dead" version of it that plays an animation and stays there for x amount of time so
	// AI doesnt target it
	if (castle_health <= 0){
		instance_destroy();
	}


}
