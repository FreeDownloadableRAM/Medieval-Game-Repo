// Pause Wrapper (DON'T run anything if the game state is paused...)
if (global.is_game_paused == true){
	// Do Nothing
	

}
else{
	// So game isnt paused, what do we do when hit?
	// The type of attack hitting us is determined from the events tab, so we dont have to
	// account for it here
	global.player_castle_health_enemy -= (global.pikeman_atk - (global.pikeman_atk * castle_thrust_defence));
	castle_health = global.player_castle_health_enemy;
	// If health drops below zero or is zero, destroy this instance
	if (castle_health <= 0){
		// destroy this object
		instance_destroy();
		
	}
}
