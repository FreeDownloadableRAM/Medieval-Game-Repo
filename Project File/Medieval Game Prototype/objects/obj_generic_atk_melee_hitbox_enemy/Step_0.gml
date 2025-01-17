/// count down, once the anim duration is complete, self destroy this object

if (global.is_game_paused == true){
	// Do Nothing
	

}
else {
	// decrease timer value
	animation_duration -= 1;
	
	if (animation_duration <= 0){
		// If we reach zero, delete this object
		instance_destroy();
	}
}


