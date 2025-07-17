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

// Now add highlighted order

// highlight

// shader setup
// colour swapper shader (indexed colour)
shader_set(shd_indx_col_swapper); 

// variables
var samp_palette = shader_get_sampler_index(shd_indx_col_swapper, "samp_palette"); // important that the "" name matches the one inside shader
var palette_sprite = col_pal_ui;

texture_set_stage(samp_palette,sprite_get_texture(palette_sprite,0)); // get the colour palette sprite

var u_palette_size = shader_get_uniform(shd_indx_col_swapper, "u_palette_size");
var u_palette_index = shader_get_uniform(shd_indx_col_swapper, "u_palette_index");

shader_set_uniform_f(u_palette_size,sprite_get_height(palette_sprite));
shader_set_uniform_f(u_palette_index,colour_palette_index);


// selection
if (ui_ai_order == 0){

	draw_sprite_ext(spr_ui_ai_ordr_but_ordr_hl,0,camera_get_view_x(view_camera[0]) + ui_placement_offset_x_retr,ui_placement_offset_y,-1,1,0,c_white,1);

}
else if (ui_ai_order == 1){

	draw_sprite(spr_ui_ai_ordr_but_def_hl,0,camera_get_view_x(view_camera[0]) + ui_placement_offset_x,ui_placement_offset_y);

}
else {

	draw_sprite(spr_ui_ai_ordr_but_ordr_hl,0,camera_get_view_x(view_camera[0]) + ui_placement_offset_x_atk,ui_placement_offset_y);

}

// draw self within shader so that it uses the shaders effects.
draw_self();

shader_reset();
