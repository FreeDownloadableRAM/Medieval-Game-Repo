//// @description determine if we want eco upgrade
/// Economy Consideration
// Do not delete, this tells ai if they should save up.
// You can write your code in this editor
if (global.is_game_paused == true){

	// If the game is paused, DO NOT run this code

}
else {
	// Generate a random number from 0-1
	ai_upgrade_econ_chance = random_range(0,1);

	// If the game is not paused, run this code:
	// Every time alarm is triggerd, roll a change to see if you want to save to upgrade economy
	if (ai_eco_lv == 0){ // 0 is base, // 7 is max){}
		// If the number generated is lower than the threshold, save up. 
		if (ai_upgrade_econ_chance <= eco_up_ch_thres_lv_0){
			// Make AI plan to save up for eco upgrade.
			ai_eco_up_save = true;
		}
		else {
			// If not do nothing.
				
		}
			
	}
	else if(ai_eco_lv == 1){
			// If the number generated is lower than the threshold, save up. 
			if (ai_upgrade_econ_chance <= eco_up_ch_thres_lv_1){
				// Make AI plan to save up for eco upgrade.
				ai_eco_up_save = true;
			}
			else {
				// If not do nothing.
				
			}
		
		}
	else if(ai_eco_lv == 2){
			// If the number generated is lower than the threshold, save up. 
			if (ai_upgrade_econ_chance <= eco_up_ch_thres_lv_2){
				// Make AI plan to save up for eco upgrade.
				ai_eco_up_save = true;
			}
			else {
				// If not do nothing.
				
			}
		
		}
	else if(ai_eco_lv == 3){
			// If the number generated is lower than the threshold, save up. 
			if (ai_upgrade_econ_chance <= eco_up_ch_thres_lv_3){
				// Make AI plan to save up for eco upgrade.
				ai_eco_up_save = true;
			}
			else {
				// If not do nothing.
				
			}
		
		}
	else if(ai_eco_lv == 4){
			// If the number generated is lower than the threshold, save up. 
			if (ai_upgrade_econ_chance <= eco_up_ch_thres_lv_4){
				// Make AI plan to save up for eco upgrade.
				ai_eco_up_save = true;
			}
			else {
				// If not do nothing.
				
			}
		
		}
	else if(ai_eco_lv == 5){
			// If the number generated is lower than the threshold, save up. 
			if (ai_upgrade_econ_chance <= eco_up_ch_thres_lv_5){
				// Make AI plan to save up for eco upgrade.
				ai_eco_up_save = true;
			}
			else {
				// If not do nothing.
				
			}
		
		}
	else if(ai_eco_lv == 6){
			// If the number generated is lower than the threshold, save up. 
			if (ai_upgrade_econ_chance <= eco_up_ch_thres_lv_6){
				// Make AI plan to save up for eco upgrade.
				ai_eco_up_save = true;
			}
			else {
				// If not do nothing.
				
			}
		
		}
	else{
			// You are at eco level 7, there are no more upgrades.
		
		}
	
}



// reset alarm
alarm_set(8,(7*fps));