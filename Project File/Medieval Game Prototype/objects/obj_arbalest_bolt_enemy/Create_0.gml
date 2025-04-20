/// Override animation duration
//animation_duration = global.arbalest_atk_duration;

projectile_weight = global.arbalest_bolt_weight;
velocity_x = global.arbalest_bolt_initial_velocity * (-1);
velocity_y = 0;
velocity_y_margin_of_error = random_range(-1.25,0.25);
velocity_x_margin_of_error = random_range(-4,4);

// particle type
trail_particle = part_type_create();
part_type_sprite(trail_particle,spr_projectile_trail,0,0,0);
part_type_alpha3(trail_particle,1,1,0);
part_type_life(trail_particle,60,60);
part_type_size(trail_particle,1,1,0,0);