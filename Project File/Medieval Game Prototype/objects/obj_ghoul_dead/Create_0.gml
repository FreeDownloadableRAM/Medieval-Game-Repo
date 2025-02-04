/// This is the parent for all character corpses
// It will control the dead body characterists

//Clear Timer
alarm_set(0,(10*fps));

//Death animation timer
death_animation_fps = 12;
death_animation_frames = 17;
death_animation_time = (death_animation_frames/death_animation_fps)*fps; 
alarm_set(1,death_animation_time); // 1 second


//Death animation
sprite_index = spr_gh_06_death_1;


//Dead Body
dead_body_sprite = spr_dbg_invisible;

//invisible
invisible_sprite = spr_dbg_invisible;

// Help AI track Information
global.player_gh_count -= 1;

// lower player unit count
global.player_unit_count -= 1;