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
sprite_index = spr_sm_06_death_1_indx;


//Dead Body
dead_body_sprite = spr_sm_07_dead_1_indx;

//invisible
invisible_sprite = spr_dbg_invisible;

// Help AI track Information
global.ally_2_sm_count -= 1;

// lower player unit count
global.ally_2_unit_count -= 1;

// colour palette properties
colour_palette_index = global.slot_three_colour; // 0 def, 1-3 allies, 4 enemy def, 5-7 enemy allies

col_pal_death = spr_sm_indx_col_plte_06_dth;
col_pal_dead = spr_sm_indx_col_plte_07_dead;