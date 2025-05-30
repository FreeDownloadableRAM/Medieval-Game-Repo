// set x position to center of camera
//x = camera_get_view_x(view_camera[0]);

// stationary version
spawn_location_x = 1728;

// set y location to slightly above screen
spawn_location_y = -32;

// create particle resource for characters to use resource
weather_particle_system = part_system_create_layer("weather_effects_layer",0,ps_rain_heavy);

// set position
part_system_position(weather_particle_system,spawn_location_x,spawn_location_y);


