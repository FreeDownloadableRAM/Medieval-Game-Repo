// run timers
if (global.is_game_paused == true){
	// do not run

}
else {
	// Follow camera
	if (global.game_winner == 1){
		
		sprite_index = spr_win_graphic;
	
	}
	else if (global.game_winner == 2){
		
		sprite_index = spr_lose_graphic;
	
	}
	else {
		// Set to win
		sprite_index = spr_dbg_invisible;
	
	}
	x = camera_get_view_x(view_camera[0]) + 768;
	

}