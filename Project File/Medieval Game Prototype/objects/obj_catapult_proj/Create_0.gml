/// Override animation duration
//animation_duration = global.arbalest_atk_duration;

projectile_weight = global.catapult_proj_weight;
velocity_initial = global.catapult_proj_initial_velocity; // usually
//projectile_weight = 0.0; // 72 kg
projectile_weight = 0.25;
//velocity_initial = ((30/0.11)*4)/60; // test convert m/s to pixels per second
velocity_x = 0.0;
velocity_y = 0.0;
angle_margin_of_error = irandom_range(-2,2); // -2 and 10 previously

initial_height = 180; // 180
proj_gravity = (global.gravity_value);
//proj_gravity = ((9.8/4)*0.11)/fps; // test convert to m/s, originally in pixels per frame

proj_range = 0.0;
alt_fire_range_thres = 336;

// angle we shoot at
launch_angle = 0.0;

// enemy current position
target_position_x = 0.0;
target_position_y = 0.0;

starting_x_position = x;
starting_y_position = y;

target_distance_x = 0.0;
target_height_difference = 0.0;

enemy_target = obj_generic_npc_enemy;
enemy_castle_target = obj_castle_enemy;

in_range = "false";

// We are invisible until fired
sprite_index = spr_cp_08_projectile;

//Clear Timer
//alarm_set(0,((43/9)*fps)); // make the timer as long as the character attack animation arrow launch frame
alarm_set(0,1);

// prevent lag
alarm_set(1,(15*60));