/// arrow creation delay
// here we will wait a little until we shoot the arrow,
// because the ranger animation takes time to get there

sprite_index = spr_cp_08_projectile;

// calculate what angle and power to launch at
// we know the initial projectile speed (24 pixels per frame) 
// we know the x and y position of the target
// we know gravity (9.8)
// we know initial height off of ground level (144 pixels)
// we DONT know launch angle

// isolate launch angle 
var _velocity_initial = global.catapult_proj_initial_velocity;
var _height_initial = initial_height;
var _launch_angle_rad;
var _unknown_angle;
var _secondary_angle;

launch_angle = degtorad(60); // placeholder



// get closest enemy position
var _closest_enemy;

// if enemy exists
if (instance_exists(enemy_target) && global.enemy_order != 0){
	
	
		// Get the nearest instance of this target object
		_closest_enemy = instance_nearest(x,y,enemy_target);
		
		// Set position targets to closest enemy x and y values
		target_position_x = _closest_enemy.x;
		target_position_y = _closest_enemy.y;
	
		target_distance_x = target_position_x - starting_x_position; // height cannot be negative
		target_height_difference = 0; // king 672, room height 864
	
		target_distance_x = target_distance_x * 0.92;
		
		// determine if we are going to lob attacks OR fire at target
		
		if (target_distance_x < alt_fire_range_thres){
			//return angle from us to target
			launch_angle = point_direction(starting_x_position,starting_y_position,target_position_x,target_position_y);
			
			// add error
			launch_angle = launch_angle + angle_margin_of_error;
			
			//launch_angle = launch_angle;
	
			velocity_x = ((velocity_initial) * cos(degtorad(launch_angle)));
			velocity_y = ((velocity_initial) * sin(degtorad(launch_angle))) * (-1);
			
		}
		else {
		
			// calculate launch angle
			// courtesy of https://www.youtube.com/watch?v=pQ23Eb-bXvQ&ab_channel=MichelvanBiezen
			// Michael Van Biezen
			// This is where we get our eqn. to find suitable angle to launch at a given distance with a 
			// starting height, velocity, distance, and weight
		
			// p = phi, our secondary angle
			// p = tan (^-1) (x / h)	// x is horizontal distance we want to travel
											// h is our initial height
		
			// a = theta, our final launch angle
			// (2a - p) = cos(^-1) [((gx^2)-h)/(sqrt(h^2 + x^2))]
		
			// solve p first
			_secondary_angle = radtodeg(arctan(target_distance_x / (target_height_difference))); // result is in radians
		
			_secondary_angle = _secondary_angle % 360;
		
			// here we will calcultate the value before we inverse cosine it, to check if it is possible
			_unknown_angle = ((((proj_gravity * projectile_weight * target_distance_x * target_distance_x)/(_velocity_initial * _velocity_initial))-target_height_difference)
									/ (sqrt((target_height_difference * target_height_difference)+(target_distance_x * target_distance_x))));
			
			_unknown_angle = _unknown_angle % 360;
	
			//debug
			in_range = "true castle";
		
			// we are in range
			// restriction intake is -1,1 for arc cos
			//_launch_angle_rad = (arccos(clamp((degtorad(_unknown_angle + _secondary_angle)),-1,1)))/2;
			
			
			// cos(^-1) [unknown angle] section
			_launch_angle_rad = arccos(clamp((degtorad(_unknown_angle)),-1,1));
			
			// a + p
			//_launch_angle_rad = _launch_angle_rad + clamp(degtorad(_secondary_angle),((-1/2)*pi),((1/2)*pi));
			_launch_angle_rad = _launch_angle_rad + degtorad(_secondary_angle);
			
			// a / 2
			_launch_angle_rad = _launch_angle_rad/2;
			
			//_launch_angle_rad = (_unknown_angle + _secondary_angle)/2;
			
			// convert to degrees
			launch_angle = radtodeg(_launch_angle_rad);
			
			// add error
			launch_angle = launch_angle + angle_margin_of_error;
			
			//launch_angle = launch_angle;
	
			velocity_x = (velocity_initial * cos(degtorad(launch_angle)));
			velocity_y = (velocity_initial * sin(degtorad(launch_angle))) * (-1);
		
		}
		
		
	
	

}
// No enemy
else {
	// no enemy, is there a castle?
	if (instance_exists(enemy_castle_target)){

		target_position_x = enemy_castle_target.x;
		target_position_y = enemy_castle_target.y;
		/*
		target_distance_x = (((target_position_x - starting_x_position)/4)) * 0.11; // convert to big pixel distance
																				// then convert to metres
		*/
		target_distance_x = (target_position_x - starting_x_position);									
		//target_height_difference =  starting_y_position - target_position_y;
		
		
		target_distance_x = target_distance_x * 0.92;
		//target_distance_x = target_distance_x - ( 10 * power(target_distance_x, (-1)));
		
		target_height_difference = 0; 
		//target_height_difference = ((((864 - starting_y_position) - (864-(target_position_y)))/4)*0.11)/2; // king 672, room height 864
		//target_height_difference = ((864 - starting_y_position) - (864-(target_position_y)))/2;
		//target_height_difference = 0;
		//target_height_difference = 192;
		//instance_create_layer(target_position_x,target_position_y,"Targets",obj_projectile_trail);
		
		// Shallow
		//_unknown_angle = ((proj_gravity * projectile_weight * target_position_x) / (_velocity_initial * _velocity_initial));
			
		// Steep	
		// Eqn. a = 45 + 1/2cos(^-1) ((g * d) / (v^2))
		
		// courtesy of https://www.youtube.com/watch?v=pQ23Eb-bXvQ&ab_channel=MichelvanBiezen
		// Michael Van Biezen
		// This is where we get our eqn. to find suitable angle to launch at a given distance with a 
		// starting height, velocity, distance, and weight
		
		// p = phi, our secondary angle
		// p = tan (^-1) (x / h)	// x is horizontal distance we want to travel
									// h is our initial height
		
		// a = theta, our final launch angle
		// (2a - p) = cos(^-1) [((gx^2)/v^2)-h)/(sqrt(h^2 + x^2))]
		// 2a = (cos(^-1) (_unknown_angle)) + p
		// a =
		
		// solve p first
		_secondary_angle = radtodeg(arctan(target_distance_x / (target_height_difference))); // result is in radians
		
		
		_secondary_angle = _secondary_angle % 360;
		
		// here we will calcultate the value before we inverse cosine it, to check if it is possible
		_unknown_angle = ((((proj_gravity * projectile_weight * target_distance_x * target_distance_x)/(_velocity_initial * _velocity_initial))-target_height_difference)
								/ (sqrt((target_height_difference * target_height_difference)+(target_distance_x * target_distance_x))));
			
		_unknown_angle = _unknown_angle % 360;
	
			
		
			// we are in range
			// restriction intake is -1,1 for arc cos
			//_launch_angle_rad = (arccos(clamp((degtorad(_unknown_angle + _secondary_angle)),-1,1)))/2;
			
			
			// cos(^-1) [unknown angle] section
			_launch_angle_rad = arccos(clamp((degtorad(_unknown_angle)),-1,1));
			//_launch_angle_rad = arccos(clamp((_unknown_angle),-1,1));
			
			// a + p
			//_launch_angle_rad = _launch_angle_rad + clamp(degtorad(_secondary_angle),((-1/2)*pi),((1/2)*pi));
			_launch_angle_rad = _launch_angle_rad + degtorad(_secondary_angle);
			
			// a / 2
			_launch_angle_rad = _launch_angle_rad/2;
			
			//_launch_angle_rad = (_unknown_angle + _secondary_angle)/2;
			
			// convert to degrees
			launch_angle = radtodeg(_launch_angle_rad);
		
			// add error
			launch_angle = launch_angle + angle_margin_of_error;
			
			//launch_angle = launch_angle;
			
			
		
		velocity_x = (velocity_initial * cos(degtorad(launch_angle)));
		velocity_y = (velocity_initial * sin(degtorad(launch_angle))) * (-1);
		
	}
	// No castle, No enemy
	else {
		velocity_x = (velocity_initial * cos(degtorad(45)));
		velocity_y = (velocity_initial * sin(degtorad(45))) * (-1);
	}

}

