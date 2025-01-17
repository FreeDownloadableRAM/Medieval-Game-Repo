/// @description use buttons

// check if we are within icon bounds
if (mouse_x < (x + bar_size_x_from_center + 1) && mouse_x > (x - bar_size_x_from_center - 1)
		&& mouse_y < (y + bar_size_y_from_center + 1) && mouse_y > (y - bar_size_y_from_center - 1)){
		
	// We are slider bar bounds
	slider_pos_x = mouse_x;
	global.sound_effects_slider_x = slider_pos_x;
	
	if (slider_pos_x < (x - bar_size_x_from_center)){
		// if we are to the left of the slider bar
		// set the slider to minimum of the bar (to the left edge)
		slider_pos_x = (x - bar_size_x_from_center);
	
	}
	if (slider_pos_x > (x + bar_size_x_from_center)){
		// if we are to the right of the slider bar
		// set the slider to maximum of the bar (to the right edge)
		slider_pos_x = (x + bar_size_x_from_center);
	
	}
}
else {
	// We are NOT within slider bar bounds
		
}

// record the value of our volume
slider_volume_perc = (slider_pos_x - (x - bar_size_x_from_center)) / bar_size_x;
// set the music global volume amplifier to this local value
global.sound_effects_amp_decimal = slider_volume_perc;


// set the bar sprite sub image
bar_spr_subimg_val = round(slider_volume_perc * bar_spr_subimg_val_max); // this is reversed because the sprite starts at max, then goes to min
bar_spr_subimg_val = clamp(bar_spr_subimg_val_max - bar_spr_subimg_val,0,100);

// set the audio image from 0 - 3.
// 0 = full, 3 equal empty
if (bar_spr_subimg_val >= 75){
	// 75% of volume or higher
	bar_spr_subimg_audio_icon = 3;

}
else if (bar_spr_subimg_val >= 50){
	// 50% of volume or higher
	bar_spr_subimg_audio_icon = 2;

}
else if (bar_spr_subimg_val >= 25){
	// 25% of volume or higher
	bar_spr_subimg_audio_icon = 1;

}
else {
	// less than 25% of volume
	bar_spr_subimg_audio_icon = 0;

}
