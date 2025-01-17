/// @description Draw this on top no matter what
// draw lvl info
// Now draw the flag sprite relative to the cursor position
// If player controller exists
if (d_this_n_info == true){
	// if player controller is colliding with this nation
	draw_sprite(n_flag,0,(mouse_x + 80),(mouse_y - 48));
	draw_sprite(n_unit_unlock,n_is_unit_unlocked,(mouse_x + 40),(mouse_y - 128));
	draw_sprite(n_unit_lock_icon,n_is_unit_unlocked,(mouse_x + sprite_get_width(n_unit_unlock)),(mouse_y - 106));
}