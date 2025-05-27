/// @description Nation Icon Properties
// Here we set the sprites
icon_nation = spr_lvl_12_n;
icon_nation_hlight = spr_lvl_12_nh;
lvl_dstnation = rm_lvl_12_island;
icon_nation_cmplt = spr_lvl_12_cmplt;
lvl_complete = global.lvl_12_clear;

sprite_index = spr_lvl_01_n; // by default, in step, we will use the defined sprites from above

can_play_lvl = false;

freeze_menu_slct = true;

alarm_set(0,60);

// Nation Info
n_flag = spr_lvl_12_flag; 

// unit unlock info
n_unit_unlock = spr_dbg_invisible;
n_unit_lock_icon = spr_dbg_invisible;
n_gamemode = 0;

// is unit unlocked? if so, set sub image to the unlock frame
if (global.lvl_10_clear == true || global.lvl_9_clear == true){
	n_is_unit_unlocked = 0;
}
else {
	n_is_unit_unlocked = 1;
}

d_this_n_info = false;

// Can we select this level?
if (global.lvl_10_clear == true){
	// If we cleared any of these levels, we can play this one
	can_play_lvl = true;
}
else {
	// If we havent cleared any of those levels, this one isnt playable.
	can_play_lvl = false;
	// We are not allowed to play the lvl
	sprite_index = spr_dbg_invisible;
}

//image_xscale = 4; // scale up by 4 to fit
//image_yscale = 4; // scale up by 4 to fit

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

global.ally_1_can_train_sm = false;
global.ally_1_can_train_pm = true;
global.ally_1_can_train_rg = true;
global.ally_1_can_train_kn = true;
global.ally_1_can_train_ab = false;
global.ally_1_can_train_hb = false;
global.ally_1_can_train_mg = false;
global.ally_1_can_train_cp = false;
global.ally_1_can_train_nc = false;
global.ally_1_can_train_gh = false;

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

global.enemy_2_can_train_sm = true;
global.enemy_2_can_train_pm = true;
global.enemy_2_can_train_rg = true;
global.enemy_2_can_train_kn = false;
global.enemy_2_can_train_ab = false;
global.enemy_2_can_train_hb = false;
global.enemy_2_can_train_mg = false;
global.enemy_2_can_train_cp = false;
global.enemy_2_can_train_nc = false;
global.enemy_2_can_train_gh = false;