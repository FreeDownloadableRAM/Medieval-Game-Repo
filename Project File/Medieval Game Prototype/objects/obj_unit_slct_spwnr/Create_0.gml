/// @description Spawn in unit types based off what levels we cleared
// Here are the unit types and the methods to unlock them
// we will always have swordmen by default
instance_create_layer(64,64,"UI_elements",obj_ui_player_sm_train);

// ranger unit
if (global.lvl_1_clear == true){
	instance_create_layer(256,64,"UI_elements",obj_ui_player_rg_train);

}

// pikeman unit
if (global.lvl_2_clear == true){
	instance_create_layer(160,64,"UI_elements",obj_ui_player_pm_train);

}

// knight unit
if (global.lvl_3_clear == true){
	instance_create_layer(352,64,"UI_elements",obj_ui_player_kn_train);

}

// arbalest unit
if (global.lvl_4_clear == true){
	instance_create_layer(448,64,"UI_elements",obj_ui_player_ab_train);

}

// halberdier unit
if (global.lvl_5_clear == true){
	instance_create_layer(544,64,"UI_elements",obj_ui_player_hb_train);

}

// magician unit
if (global.lvl_6_clear == true){
	instance_create_layer(640,64,"UI_elements",obj_ui_player_mg_train);

}

// catapult unit
if (global.lvl_8_clear == true || global.lvl_9_clear){
	instance_create_layer(736,64,"UI_elements",obj_ui_player_cp_train);

}

if (global.lvl_10_clear == true){
	instance_create_layer(832,64,"UI_elements",obj_ui_player_nc_train);

}

// create order buttons
// retr
instance_create_layer(640,816,"UI_elements",obj_ui_ordr_but_retr);
// def
instance_create_layer(768,816,"UI_elements",obj_ui_ordr_but_gen);
// atk
instance_create_layer(896,816,"UI_elements",obj_ui_ordr_but_atk);
