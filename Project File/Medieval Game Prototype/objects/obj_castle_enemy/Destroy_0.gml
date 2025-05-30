// level clear logic

// whenever this object is destroyed, update player progress in campaign
// If health drops below zero or is zero, destroy this instance, in the case of a soldier NPC
// We spaw a "dead" version of it that plays an animation and stays there for x amount of time so
// AI doesnt target it

// Set clear flags
if (room == rm_lvl_01_tut){
	// Set clear
	global.lvl_1_clear = true;
}
else if (room == rm_lvl_02_piercing_winds){
	// Set clear
	global.lvl_2_clear = true;
}
else if (room == rm_lvl_03_ruby_wet_lands){
	// Set clear
	global.lvl_3_clear = true;
}
else if (room == rm_lvl_04_warm_farm_fields){
	// Set clear
	global.lvl_4_clear = true;
}
else if (room == rm_lvl_05_city_of_light){
	// Set clear
	global.lvl_5_clear = true;
}
else if (room == rm_lvl_06_magical_forest){
	// Set clear
	global.lvl_6_clear = true;
}
else if (room == rm_lvl_07_alliance_of_arms){
	// Set clear
	global.lvl_7_clear = true;
}
else if (room == rm_lvl_08_highlands){
	// Set clear
	global.lvl_8_clear = true;
	
}
else if (room == rm_lvl_09_portland){
	// Set clear
	global.lvl_9_clear = true;
	
}
else if (room == rm_lvl_10_ice_mountains){
	// Set clear
	global.lvl_10_clear = true;
	
}
else if (room == rm_lvl_11_ice_fields){
	// Set clear
	global.lvl_11_clear = true;
	
}
else if (room == rm_lvl_12_island){
	// Set clear
	global.lvl_12_clear = true;
	
}
else if (room == rm_lvl_13_arctic_snow){
	// Set clear
	global.lvl_13_clear = true;
	
}
else if (room == rm_lvl_14_forest_plains){
	// Set clear
	global.lvl_14_clear = true;
	
}
else if (room == rm_lvl_14_forest_plains){
	// Set clear
	global.lvl_14_clear = true;
	
}
else if (room == rm_lvl_15_fertile_coast){
	// Set clear
	global.lvl_15_clear = true;
	
}
else if (room == rm_lvl_19_volcano){
	// Set clear
	global.lvl_19_clear = true;
	
}
else{
	// Dont unlock anything
		
}

// update game winner value
global.game_winner = 1;