/// @description spawn the nation icons
// depending on lvl progression, we spawn in the different nations that can then be selected to play

// Local object variables
x_spwn_loc = 960;
y_spwn_loc = 544;

// conditions

if (global.lvl_1_clear){
	// If lvl 1 is cleared, we can play lvl 2 or 3
	instance_create_layer(x_spwn_loc,y_spwn_loc,"Inst_lvl_icons",obj_ns_lvl_2);
	instance_create_layer(x_spwn_loc,y_spwn_loc,"Inst_lvl_icons",obj_ns_lvl_3);
	
}
if (global.lvl_2_clear){
	// If lvl 1 is cleared, we can play lvl 4 6 7 or 8
	instance_create_layer(x_spwn_loc,y_spwn_loc,"Inst_lvl_icons",obj_ns_lvl_4);
	instance_create_layer(x_spwn_loc,y_spwn_loc,"Inst_lvl_icons",obj_ns_lvl_6);
	instance_create_layer(x_spwn_loc,y_spwn_loc,"Inst_lvl_icons",obj_ns_lvl_7);
	instance_create_layer(x_spwn_loc,y_spwn_loc,"Inst_lvl_icons",obj_ns_lvl_8);

}
if (global.lvl_3_clear){

}

// no matter what, we always spawn in the first lvl, regardless of progress
instance_create_layer(x_spwn_loc,y_spwn_loc,"Inst_lvl_icons",obj_ns_lvl_1);