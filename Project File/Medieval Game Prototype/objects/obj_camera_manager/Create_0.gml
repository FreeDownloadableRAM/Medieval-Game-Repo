// follow object
follow_object = obj_player_controller;

// camera properties
camera_width = camera_get_view_width(view_camera[0]);
camera_height = camera_get_view_height(view_camera[0]);

// move camera towards this
x_towards = x;
y_towards = y;

// how strong do we want the slow down effect to be?
ease_in_factor = 25;

x = camera_width * 2;

// control properties
vertical_deadzone_top = 128;
vertical_deadzone_bottom = 768;