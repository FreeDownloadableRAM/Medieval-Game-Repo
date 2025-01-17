/// @description Drawing properties
// draw bar
draw_sprite(bar_sprite,bar_spr_subimg_val,x,y); // draw this at our current position

// draw minus and plus sign
draw_sprite(bar_sprite_minus,0,x - minus_offset - bar_size_x_from_center,y); // draw this to the left

draw_sprite(bar_sprite_plus,0,x + plus_offset + bar_size_x_from_center,y); // draw this to the right

// draw icon
draw_sprite(bar_sprite_icon,bar_spr_subimg_audio_icon, (x - minus_offset - bar_size_x_from_center) - audio_icon_width,y); // draw this at our current position


// draw slider
draw_sprite(bar_sprite_slider,0,slider_pos_x,slider_pos_y); // draw this at our current position

// see decimal point
//draw_set_color(c_white);
//draw_text(x + plus_offset + bar_size_x_from_center + 24,y,string(round(slider_volume_perc*100)) + " %")
//draw_text(1762,64,"sub img val: " + string(bar_spr_subimg_val))
//draw_text(1762,80,"max sub img val: " + string(bar_spr_subimg_val_max))