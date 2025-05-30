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
		
		// ally 1
		// ally ai 1 unit ai trackers // slot 1
		global.ally_1_sm_count = 0;
		global.ally_1_pm_count = 0;
		global.ally_1_rg_count = 0;
		global.ally_1_kn_count = 0;
		global.ally_1_ab_count = 0;
		global.ally_1_hb_count = 0;
		global.ally_1_mg_count = 0;
		global.ally_1_cp_count = 0;
		global.ally_1_nc_count = 0;
		global.ally_1_gh_count = 0;

		global.ally_1_can_train_sm = true;
		global.ally_1_can_train_pm = true;
		global.ally_1_can_train_rg = false;
		global.ally_1_can_train_kn = true;
		global.ally_1_can_train_ab = false;
		global.ally_1_can_train_hb = false;
		global.ally_1_can_train_mg = true;
		global.ally_1_can_train_cp = true;
		global.ally_1_can_train_nc = true;
		global.ally_1_can_train_gh = true;
		
		// ally 3
		// ally ai 3 unit ai trackers // slot 1
		global.ally_3_sm_count = 0;
		global.ally_3_pm_count = 0;
		global.ally_3_rg_count = 0;
		global.ally_3_kn_count = 0;
		global.ally_3_ab_count = 0;
		global.ally_3_hb_count = 0;
		global.ally_3_mg_count = 0;
		global.ally_3_cp_count = 0;
		global.ally_3_nc_count = 0;
		global.ally_3_gh_count = 0;

		global.ally_3_can_train_sm = true;
		global.ally_3_can_train_pm = true;
		global.ally_3_can_train_rg = false;
		global.ally_3_can_train_kn = true;
		global.ally_3_can_train_ab = false;
		global.ally_3_can_train_hb = true;
		global.ally_3_can_train_mg = true;
		global.ally_3_can_train_cp = true;
		global.ally_3_can_train_nc = true;
		global.ally_3_can_train_gh = true;

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

		global.enemy_can_train_sm = false;
		global.enemy_can_train_pm = false;
		global.enemy_can_train_rg = false;
		global.enemy_can_train_kn = true;
		global.enemy_can_train_ab = false;
		global.enemy_can_train_hb = false;
		global.enemy_can_train_mg = false;
		global.enemy_can_train_cp = true;
		global.enemy_can_train_nc = false;
		global.enemy_can_train_gh = false;
	
		// enemy 2
		// enemy ai 2 unit ai trackers // slot 5
		global.enemy_2_sm_count = 0;
		global.enemy_2_pm_count = 0;
		global.enemy_2_rg_count = 0;
		global.enemy_2_kn_count = 0;
		global.enemy_2_ab_count = 0;
		global.enemy_2_hb_count = 0;
		global.enemy_2_mg_count = 0;
		global.enemy_2_cp_count = 0;
		global.enemy_2_nc_count = 0;
		global.enemy_2_gh_count = 0;

		global.enemy_2_can_train_sm = false;
		global.enemy_2_can_train_pm = false;
		global.enemy_2_can_train_rg = false;
		global.enemy_2_can_train_kn = true;
		global.enemy_2_can_train_ab = false;
		global.enemy_2_can_train_hb = true;
		global.enemy_2_can_train_mg = false;
		global.enemy_2_can_train_cp = true;
		global.enemy_2_can_train_nc = false;
		global.enemy_2_can_train_gh = false;
		
		// enemy 3
		// enemy ai 3 unit ai trackers // slot 5
		global.enemy_3_sm_count = 0;
		global.enemy_3_pm_count = 0;
		global.enemy_3_rg_count = 0;
		global.enemy_3_kn_count = 0;
		global.enemy_3_ab_count = 0;
		global.enemy_3_hb_count = 0;
		global.enemy_3_mg_count = 0;
		global.enemy_3_cp_count = 0;
		global.enemy_3_nc_count = 0;
		global.enemy_3_gh_count = 0;

		global.enemy_3_can_train_sm = false;
		global.enemy_3_can_train_pm = false;
		global.enemy_3_can_train_rg = false;
		global.enemy_3_can_train_kn = true;
		global.enemy_3_can_train_ab = false;
		global.enemy_3_can_train_hb = false;
		global.enemy_3_can_train_mg = false;
		global.enemy_3_can_train_cp = true;
		global.enemy_3_can_train_nc = false;
		global.enemy_3_can_train_gh = false;
		
		// enemy 2
		// enemy ai 2 unit ai trackers // slot 5
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
		global.enemy_4_can_train_rg = false;
		global.enemy_4_can_train_kn = true;
		global.enemy_4_can_train_ab = false;
		global.enemy_4_can_train_hb = false;
		global.enemy_4_can_train_mg = false;
		global.enemy_4_can_train_cp = true;
		global.enemy_4_can_train_nc = false;
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