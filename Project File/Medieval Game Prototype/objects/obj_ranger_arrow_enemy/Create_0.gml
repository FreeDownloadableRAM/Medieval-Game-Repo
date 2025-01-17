/// Override animation duration
//animation_duration = global.arbalest_atk_duration;

projectile_weight = global.ranger_arrow_weight;
velocity_x = global.ranger_arrow_initial_velocity * (-1);
velocity_y = 0;
velocity_y_margin_of_error = random_range(-2.25,-0.25);
velocity_x_margin_of_error = random_range(-4,4);

// We are invisible until fired
sprite_index = spr_rg_08_projectile;

//Clear Timer
//alarm_set(0,((43/9)*fps)); // make the timer as long as the character attack animation arrow launch frame
alarm_set(0,1);
