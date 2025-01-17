/// physics
move_target_gravity = 0.02;
vertical_movement_speed = 0.0;

// Track Mouse 
new_x_position = round(x); // x position the mouse controlled object moves to
new_y_position = round(y); // y position the mouse controlled object moves to

//Animation Handler
sprite_index = spr_rally_flag_red;
idle_anim = spr_rally_flag_red;
sway_anim = spr_rally_flag_red_sway;

alarm_time_value = 10;
alarm_time_initial_addition = 60;

//Check and generate number frequency
alarm_set(0,((alarm_time_value*fps) + alarm_time_initial_addition));

random_generated_number = 0;

idle_sway_animation_chance = 0.25;