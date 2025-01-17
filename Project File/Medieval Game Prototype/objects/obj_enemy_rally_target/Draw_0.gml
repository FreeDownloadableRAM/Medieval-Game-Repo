/// for debugging purposes
draw_self();

// The code below allows us to see the propteries of what determines if the flag sways:

/*
draw_set_color(c_white);

draw_text(x - 16,y - 96, "alarm: " + string(alarm_get(0)));
draw_text(x - 16,y - 48, "number generated: " + string(random_generated_number));
draw_text(x - 16,y - 32, "chance to sway: " + string(idle_sway_animation_chance));
draw_text(x - 16,y - 16, "frames per second: " + string(fps));

*/