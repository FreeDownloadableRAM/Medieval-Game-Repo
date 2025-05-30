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
		
		// enemy 4
		// enemy ai 3 unit ai trackers // slot 6
		global.enemy_4_sm_count = 0;
		global.enemy_4_pm_count = 0;
		global.enemy_4_rg_count = 0;
		global.enemy_4_kn_count = 0;
		global.enemy_4_ab_count = 0;
		global.enemy_4_hb_count = 0;
		global.enemy_4_mg_count = 0;
		global.enemy_4_cp_count = 0;
		global.enemy_4_nc_count = 0;
		global.enemy_4_gh_count = 0;

		global.enemy_4_can_train_sm = false;
		global.enemy_4_can_train_pm = false;
		global.enemy_4_can_train_rg = true;
		global.enemy_4_can_train_kn = false;
		global.enemy_4_can_train_ab = true;
		global.enemy_4_can_train_hb = false;
		global.enemy_4_can_train_mg = false;
		global.enemy_4_can_train_cp = false;
		global.enemy_4_can_train_nc = true;
		global.enemy_4_can_train_gh = false;
	
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