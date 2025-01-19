// shader setup
// colour swapper shader (indexed colour)
shader_set(shd_indx_col_swapper); 

// variables
var samp_palette = shader_get_sampler_index(shd_indx_col_swapper, "samp_palette"); // important that the "" name matches the one inside shader
texture_set_stage(samp_palette,sprite_get_texture(spr_sm_indx_col_plte,0)); // get the colour palette sprite

var u_palette_size = shader_get_uniform(shd_indx_col_swapper, "u_palette_size");
var u_palette_index = shader_get_uniform(shd_indx_col_swapper, "u_palette_index");

shader_set_uniform_f(u_palette_size,sprite_get_height(spr_sm_indx_col_plte));
shader_set_uniform_f(u_palette_index,colour_palette_index);

// draw self within shader so that it uses the shaders effects.
draw_self();

shader_reset();

