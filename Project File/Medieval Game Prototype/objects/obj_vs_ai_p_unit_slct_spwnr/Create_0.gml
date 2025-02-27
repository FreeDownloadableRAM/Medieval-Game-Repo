/// @description Spawn in unit types based off vs ai menu options
// Here are the unit types and the methods to unlock them

// swordman unit
if (global.player_can_train_sm == true){
	instance_create_layer(64,64,"UI_elements",obj_ui_player_sm_train);

}

// ranger unit
if (global.player_can_train_rg == true){
	instance_create_layer(256,64,"UI_elements",obj_ui_player_rg_train);

}

// pikeman unit
if (global.player_can_train_pm == true){
	instance_create_layer(160,64,"UI_elements",obj_ui_player_pm_train);

}

// knight unit
if (global.player_can_train_kn == true){
	instance_create_layer(352,64,"UI_elements",obj_ui_player_kn_train);

}

// arbalest unit
if (global.player_can_train_ab == true){
	instance_create_layer(448,64,"UI_elements",obj_ui_player_ab_train);

}

// halberdier unit
if (global.player_can_train_hb == true){
	instance_create_layer(544,64,"UI_elements",obj_ui_player_hb_train);

}

// magician unit
if (global.player_can_train_mg == true){
	instance_create_layer(640,64,"UI_elements",obj_ui_player_mg_train);

}

// catapult unit
if (global.player_can_train_cp == true){
	instance_create_layer(736,64,"UI_elements",obj_ui_player_cp_train);

}

// necromancer
if (global.player_can_train_nc == true){
	instance_create_layer(832,64,"UI_elements",obj_ui_player_nc_train);

}

// create order buttons
// retr
instance_create_layer(640,816,"UI_elements",obj_ui_ordr_but_retr);
// def
instance_create_layer(768,816,"UI_elements",obj_ui_ordr_but_gen);
// atk
instance_create_layer(896,816,"UI_elements",obj_ui_ordr_but_atk);