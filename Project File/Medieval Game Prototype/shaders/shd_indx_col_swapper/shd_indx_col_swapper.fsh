//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Tell us which colour pallete to use
// 0 = default (blue), 1-7 (8 total) are alternate colour palettes.
// 1 = green, 2 = cyan, 3 = purple // 1-3 are ally colours, 0 is player colour
// 4 = red, 5 = orange, 6 = yellow, 7 = dark grey // 4-7 are enemy colours, 4 is default enemy colour

uniform sampler2D samp_palette;

uniform float u_palette_index;
uniform float u_palette_size;

void main()
{
	// base image sprite
    vec4 index = texture2D(gm_BaseTexture, v_vTexcoord);
	// get the colour palette we want to use
	vec4 sampled_colour = texture2D(samp_palette,vec2(index.r,u_palette_index / u_palette_size));
	// output final sprite colours
	gl_FragColor = vec4(sampled_colour.rgb,index.a);
}
