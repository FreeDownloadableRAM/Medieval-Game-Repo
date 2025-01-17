// run timers
if (global.is_game_paused == true){
	// do not run

}
else {
	// Follow camera
	if (global.player_castle_health_enemy <= 0){
		
		sprite_index = spr_win_graphic;
	
	}
	else if (global.player_castle_health <= 0){
		
		sprite_index = spr_lose_graphic;
	
	}
	else {
		// Set to win
		sprite_index = spr_win_graphic;
	
	}
	x = camera_get_view_x(view_camera[0]) + 768;
	

}