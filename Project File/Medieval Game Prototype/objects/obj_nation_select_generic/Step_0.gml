/// @description set sprite to idle
// just set sprite index to non highlight
// if not unlocked, set invisible
if (can_play_lvl == false){
	// We are not allowed to play the lvl
	sprite_index = spr_dbg_invisible;

}
else{
	// Level is completed
	if (lvl_complete == true){
		sprite_index = icon_nation_cmplt;
	
	}
	// Level is not completed
	else{
		sprite_index = icon_nation;
	}
	
	
}


// toggle info display
d_this_n_info = false;