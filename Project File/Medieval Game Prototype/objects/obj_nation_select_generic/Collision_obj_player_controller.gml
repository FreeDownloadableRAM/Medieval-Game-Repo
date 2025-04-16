/// @description When player is on top of us
// just highlight the nation we are on
// make sure we have it unlocked!
if (can_play_lvl == true && freeze_menu_slct == false){
	// If we are allowed to play the lvl
	sprite_index = icon_nation_hlight;
	// if we click, put us in that lvl
	if (mouse_check_button_released(mb_left)){
		// We clicked
		room_goto(lvl_dstnation);
		// set game mode
		global.game_mode = n_gamemode;
		
		// reset game win condition
		global.game_winner = 0;
	
	}
	
	// toggle info display
	d_this_n_info = true;

}
else {
	// We are not allowed to play the lvl
	
	sprite_index = spr_dbg_invisible;
	
	// toggle info display
	d_this_n_info = true;

}


