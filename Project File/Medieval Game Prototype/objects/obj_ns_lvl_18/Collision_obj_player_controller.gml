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
		
		
		// enemy army trackers
		// enemy unit ai trackers // slot 4
		global.enemy_sm_count = 0;
		global.enemy_pm_count = 0;
		global.enemy_rg_count = 0;
		global.enemy_kn_count = 0;
		global.enemy_ab_count = 0;
		global.enemy_hb_count = 0;
		global.enemy_mg_count = 0;
		global.enemy_cp_count = 0;
		global.enemy_nc_count = 0;
		global.enemy_gh_count = 0;

		global.enemy_can_train_sm = true;
		global.enemy_can_train_pm = true;
		global.enemy_can_train_rg = true;
		global.enemy_can_train_kn = true;
		global.enemy_can_train_ab = true;
		global.enemy_can_train_hb = true;
		global.enemy_can_train_mg = true;
		global.enemy_can_train_cp = true;
		global.enemy_can_train_nc = true;
		global.enemy_can_train_gh = true;
		
		global.slot_five_eco_gen_multiplier = 2;
	
		
		
		
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