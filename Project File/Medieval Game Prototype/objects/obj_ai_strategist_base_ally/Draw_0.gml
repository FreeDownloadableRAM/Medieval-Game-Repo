// Show our orders to help player coordinate
/*
global.ally_1_order = 1; // 0 = retreat, 1 = defend / hold, 2 = attack
global.ally_2_order = 1; // 0 = retreat, 1 = defend / hold, 2 = attack
global.ally_3_order = 1; // 0 = retreat, 1 = defend / hold, 2 = attack

*/

// selection
if (ui_ai_order == 0){

	
	// position
	draw_sprite_ext(spr_ui_ai_ordr_but_def,0,camera_get_view_x(view_camera[0]) + ui_placement_offset_x,ui_placement_offset_y,1,1,0,c_white,1);
	draw_sprite_ext(spr_ui_ai_ordr_but_ordr,0,camera_get_view_x(view_camera[0]) + ui_placement_offset_x_atk,ui_placement_offset_y,1,1,0,c_white,1);
	draw_sprite_ext(spr_ui_ai_ordr_but_ordr_slct,0,camera_get_view_x(view_camera[0]) + ui_placement_offset_x_retr,ui_placement_offset_y,-1,1,0,c_white,1);


}
else if (ui_ai_order == 1){


	// position
	draw_sprite_ext(spr_ui_ai_ordr_but_def_slct,0,camera_get_view_x(view_camera[0]) + ui_placement_offset_x,ui_placement_offset_y,1,1,0,c_white,1);
	draw_sprite_ext(spr_ui_ai_ordr_but_ordr,0,camera_get_view_x(view_camera[0]) + ui_placement_offset_x_atk,ui_placement_offset_y,1,1,0,c_white,1);
	draw_sprite_ext(spr_ui_ai_ordr_but_ordr,0,camera_get_view_x(view_camera[0]) + ui_placement_offset_x_retr,ui_placement_offset_y,-1,1,0,c_white,1);


}
else {


	// position
	draw_sprite_ext(spr_ui_ai_ordr_but_def,0,camera_get_view_x(view_camera[0]) + ui_placement_offset_x,ui_placement_offset_y,1,1,0,c_white,1);
	draw_sprite_ext(spr_ui_ai_ordr_but_ordr_slct,0,camera_get_view_x(view_camera[0]) + ui_placement_offset_x_atk,ui_placement_offset_y,1,1,0,c_white,1);
	draw_sprite_ext(spr_ui_ai_ordr_but_ordr,0,camera_get_view_x(view_camera[0]) + ui_placement_offset_x_retr,ui_placement_offset_y,-1,1,0,c_white,1);

	
}
