// shader setup
// colour swapper shader (indexed colour)
shader_set(shd_indx_col_swapper); 

// variables
var samp_palette = shader_get_sampler_index(shd_indx_col_swapper, "samp_palette"); // important that the "" name matches the one inside shader
var palette_sprite = col_pal_death;

if (sprite_index == dead_body_sprite){
	
	palette_sprite = col_pal_dead;
}

else {
	palette_sprite = col_pal_death;
}

texture_set_stage(samp_palette,sprite_get_texture(palette_sprite,0)); // get the colour palette sprite

var u_palette_size = shader_get_uniform(shd_indx_col_swapper, "u_palette_size");
var u_palette_index = shader_get_uniform(shd_indx_col_swapper, "u_palette_index");

shader_set_uniform_f(u_palette_size,sprite_get_height(palette_sprite));
shader_set_uniform_f(u_palette_index,colour_palette_index);

// draw self within shader so that it uses the shaders effects.
draw_self();

shader_reset();
