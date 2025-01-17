// draw self relative to camera
if (icon_selected == true){
	// change sprite to selected
	draw_sprite(ordr_slct_spr,0,camera_get_view_x(view_camera[0]) + ui_placement_offset_x,y);
}
else {
	// revert back to default sprite
	draw_sprite(ordr_dflt_spr,0,camera_get_view_x(view_camera[0]) + ui_placement_offset_x,y);
}


// draw the auto train sprite on top if it is toggled on
if (icon_highlighted == true){
	// draw auto train sprite on top
	draw_sprite(ordr_hl_spr,0,camera_get_view_x(view_camera[0]) + ui_placement_offset_x,y);
}


// draw debug text
if (global.dev_mode == true){
	
	draw_set_color(c_white);
	
	
}
else{
	// Dont draw if we arent

}

