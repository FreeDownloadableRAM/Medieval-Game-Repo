/// Button Creation Event
// Button Properties
button_width_from_center = 32;
button_height_from_center = 32;

button_scale_x = 1;

// highlight this button
but_sprite_hl_opacity = 0;

// button sprite
button_sprite = spr_hb_unit_icon;

// show if slot can train this unit type
if (global.enemy_2_can_train_hb == true){
	// we can train, set sprite alpha to zero
	but_sprite_darken_opacity = 0;

}
else {
	// we cant train, gray it out
	but_sprite_darken_opacity = 0.5;

}
