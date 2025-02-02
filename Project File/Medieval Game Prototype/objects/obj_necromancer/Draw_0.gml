// shader setup
// colour swapper shader (indexed colour)
shader_set(shd_indx_col_swapper); 

// variables
var samp_palette = shader_get_sampler_index(shd_indx_col_swapper, "samp_palette"); // important that the "" name matches the one inside shader
var palette_sprite = col_pal_idle;

if (sprite_index == character_ready_anim){
	
	palette_sprite = col_pal_ready;
}
else if (sprite_index == character_walk_anim){
	
	palette_sprite = col_pal_walk;
}
else if (sprite_index == character_run_anim){
	
	palette_sprite = col_pal_run;
}
else if (sprite_index == spr_nc_04_attacking_1_indx){
	
	palette_sprite = col_pal_attack;
}
else if (sprite_index == spr_nc_08_summon_indx){
	
	palette_sprite = col_pal_summon;
}
else if (sprite_index == character_defend_anim){
	
	palette_sprite = col_pal_defend;
}
else {
	palette_sprite = col_pal_idle;
}

texture_set_stage(samp_palette,sprite_get_texture(palette_sprite,0)); // get the colour palette sprite

var u_palette_size = shader_get_uniform(shd_indx_col_swapper, "u_palette_size");
var u_palette_index = shader_get_uniform(shd_indx_col_swapper, "u_palette_index");

shader_set_uniform_f(u_palette_size,sprite_get_height(palette_sprite));
shader_set_uniform_f(u_palette_index,colour_palette_index);

// draw self within shader so that it uses the shaders effects.
draw_self();

shader_reset();

// we draw outside of specialized shader because these are not colour indexed sprites

// overlays
// if using one of these animations, draw this animation as well
if (sprite_index == character_ready_anim){
	// correlate frame to current object
	draw_sprite(spr_nc_01_ready_indx_overlay,-1,x,y);

}
else if (sprite_index == character_attack_anim_1){
	
	// we are throwing projectiles
	if (character_attack_anim_1 == spr_nc_04_attacking_1_indx){
		// correlate frame to current object
		draw_sprite(spr_nc_04_attacking_1_indx_overlay,-1,x,y);
	}
	// we are summoning
	else {
		draw_sprite(spr_nc_08_summon_indx_overlay,-1,x,y);
	}

}
else {
	// if we are not ready, summoning, or attacking, do not draw overlays

}
