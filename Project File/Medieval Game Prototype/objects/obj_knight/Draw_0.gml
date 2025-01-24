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
else if (sprite_index == character_attack_anim_1){
	
	palette_sprite = col_pal_attack;
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