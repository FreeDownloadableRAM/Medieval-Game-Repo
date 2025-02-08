/// This is the parent for all character corpses
// It will control the dead body characterists

//Clear Timer
alarm_set(0,(10*fps));

//Death animation timer
death_animation_fps = 8;
death_animation_frames = 50;
death_animation_time = (death_animation_frames/death_animation_fps)*fps; 
alarm_set(1,death_animation_time); // 1 second


//Death animation
if (global.slot_eight_colour == 0){
	// 0 = blue
	sprite_index = spr_mg_06_death_1;
	
}
else if (global.slot_eight_colour == 1){
	// 1 = green
	sprite_index = spr_mg_06_death_1_green;
	
}
else if (global.slot_eight_colour == 2){
	// 2 = cyan
	sprite_index = spr_mg_06_death_1_cyan;
	
}
else if (global.slot_eight_colour == 3){
	// 3 = purple
	sprite_index = spr_mg_06_death_1_purple;
	
}
else if (global.slot_eight_colour == 4){
	// 4 = red
	sprite_index = spr_mg_06_death_1_enemy;
	
}
else if (global.slot_eight_colour == 5){
	// 5 = orange
	sprite_index = spr_mg_06_death_1_orange;
	
}
else if (global.slot_eight_colour == 6){
	// 6 = yellow
	sprite_index = spr_mg_06_death_1_yellow;
	
}
else{
	// 7 = gray
	sprite_index = spr_mg_06_death_1_gray;
	
}

// Mirror
image_xscale = -1;

//Dead Body
dead_body_sprite = spr_mg_07_dead_1_enemy;

//invisible
invisible_sprite = spr_dbg_invisible;

// Help AI track Information
global.enemy_4_mg_count -= 1;

// track enemy 1 unit count
global.enemy_4_unit_count -= 1;