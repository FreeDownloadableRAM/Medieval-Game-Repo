// determine if we won or lost
if (global.is_game_paused){
	// if paused, do nothing


}
else {
	var _game_winner = global.game_winner;
	 
	// arent paused
	// did someone win?
	if (_game_winner != 0){
		// post game screen ui
		instance_create_layer(768,320,"Menus",obj_post_game_record);
		// spawn in button
		instance_create_layer(768,512,"Menus",obj_ui_btn_rtn_to_main_menu);
		
		// destroy this object, it is not needed.
		instance_destroy();
	
	}
	// no one won, do nothing
	else {
	
	
	}
	
}