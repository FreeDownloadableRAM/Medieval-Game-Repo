/// This is the parent for all character corpses
// It will control the dead body characterists

//Clear Timer
alarm_set(0,(10*fps));

//Death animation timer
death_animation_fps = 8;
death_animation_frames = 8;
death_animation_time = (death_animation_frames/death_animation_fps)*fps; 
alarm_set(1,death_animation_time); // 1 second


//Death animation
sprite_index = spr_nc_06_death_1_enemy;


//Dead Body
dead_body_sprite = spr_dbg_invisible;

//invisible
invisible_sprite = spr_dbg_invisible;

// Help AI track Information
global.enemy_nc_count -= 1;

// track enemy 1 unit count
global.player_unit_count_enemy -= 1;

image_xscale = -1; // 1 = original, -1 = flipped on x-axis