/// This is the parent for all character corpses
// It will control the dead body characterists

//Clear Timer
alarm_set(0,(10*fps));

//Death animation timer
death_animation_fps = 5;
death_animation_frames = 24;
death_animation_time = (death_animation_frames/death_animation_fps)*fps; 
alarm_set(1,death_animation_time); // 1 second


//Death animation
sprite_index = spr_ab_06_death_1_indx;

// Mirror
image_xscale = -1;

//Dead Body
dead_body_sprite = spr_ab_07_dead_1_indx;

//invisible
invisible_sprite = spr_dbg_invisible;

// Help AI track Information
global.enemy_ab_count -= 1;

// track enemy 1 unit count
global.player_unit_count_enemy -= 1;

// colour palette properties
colour_palette_index = global.slot_five_colour; // 0 def, 1-3 allies, 4 enemy def, 5-7 enemy allies

col_pal_death = spr_ab_indx_col_plte_06_dth;
col_pal_dead = spr_ab_indx_col_plte_07_dead;