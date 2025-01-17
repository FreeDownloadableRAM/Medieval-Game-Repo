/// @description Creation Properties
// Here are the sprites we are using
bar_sprite = spr_slider_bar_large;
bar_sprite_minus = spr_slider_minus;
bar_sprite_plus = spr_slider_plus;
bar_sprite_slider = spr_slider_tick;
bar_sprite_icon = spr_ui_slider_audio_icon;

// center the

// mask
mask_index = bar_sprite;

// image properties
bar_size_x = sprite_get_width(bar_sprite); // large bar size is 408, normal is 208
bar_size_x_from_center = (bar_size_x / 2);
bar_size_y = sprite_get_height(bar_sprite); // 32 regardless of bar width
bar_size_y_from_center =  (bar_size_y / 2);

minus_offset = 32;
plus_offset = 32;
audio_icon_width = 64;

// slider position
if (global.music_amp_slider_x == 0){
	slider_pos_x = x;

}
else {
	slider_pos_x = global.music_amp_slider_x;
}

slider_pos_y = y;

// slider volume 
slider_volume_perc = (slider_pos_x - (x - bar_size_x_from_center)) / bar_size_x; // 1.0 = 100% , 0.0 = 0% 

// set global music amplifier
global.music_amp_decimal = slider_volume_perc;

// location offset
bar_pos_offset_x = x;
bar_pos_offset_y = y;

// bar sprite sub image
bar_spr_subimg_val = 0; // tells us the sub image to use for background bar
bar_spr_subimg_val_max = sprite_get_number(bar_sprite); // the amount of sub images the sprite has

// set the bar sprite sub image
bar_spr_subimg_val = round(slider_volume_perc * bar_spr_subimg_val_max); // this is reversed because the sprite starts at max, then goes to min
bar_spr_subimg_val = bar_spr_subimg_val_max - bar_spr_subimg_val;

// determine audio icon lvl
bar_spr_subimg_audio_icon = 0;