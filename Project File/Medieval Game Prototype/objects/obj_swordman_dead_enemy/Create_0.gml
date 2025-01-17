/// This is the parent for all character corpses
// It will control the dead body characterists

//Clear Timer
alarm_set(0,(10*fps));

//Death animation timer
death_animation_fps = 6;
death_animation_frames = 13;
death_animation_time = (death_animation_frames/death_animation_fps)*fps; 
alarm_set(1,death_animation_time); // 1 second


//Death animation
sprite_index = spr_sm_06_death_1_enemy;


//Dead Body
dead_body_sprite = spr_sm_07_dead_1_enemy;

//invisible
invisible_sprite = spr_dbg_invisible;

image_xscale = -1;

// Help AI track Information
global.enemy_sm_count -= 1;