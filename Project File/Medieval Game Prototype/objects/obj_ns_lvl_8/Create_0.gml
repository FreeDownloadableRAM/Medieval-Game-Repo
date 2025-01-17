/// @description Nation Icon Properties
// Here we set the sprites
icon_nation = spr_lvl_08_n;
icon_nation_hlight = spr_lvl_08_nh;
lvl_dstnation = rm_lvl_08_highlands;
icon_nation_cmplt = spr_lvl_08_cmplt;
lvl_complete = global.lvl_8_clear;

sprite_index = spr_lvl_01_n; // by default, in step, we will use the defined sprites from above

can_play_lvl = false;

freeze_menu_slct = true;

alarm_set(0,60);

// Nation Info
n_flag = spr_lvl_08_flag;

// unit unlock info
n_unit_unlock = spr_cp_unlock_icon;
n_unit_lock_icon = spr_ui_unlock_lock;
// is unit unlocked? if so, set sub image to the unlock frame
if (global.lvl_8_clear == true){
	n_is_unit_unlocked = 0;
}
else {
	n_is_unit_unlocked = 1;
}

d_this_n_info = false;

// Can we select this level?
if (global.lvl_2_clear == true || global.lvl_4_clear == true || global.lvl_5_clear == true || global.lvl_6_clear == true){
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