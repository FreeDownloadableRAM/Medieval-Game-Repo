/// We use this object to control the parralax effect
// In the room editor, the background layer must have horizontal tile enabled
// Viewport 0 enabled
// Viewport 0 Visible checked

//Create map
background_map = ds_map_create();

background_map[? layer_get_id("grass_layer_1")] = 0.08; 
background_map[? layer_get_id("grass_layer_2")] = 0.12; 
background_map[? layer_get_id("grass_layer_3")] = 0.18; 
background_map[? layer_get_id("grass_layer_4")] = 0.22; 
background_map[? layer_get_id("grass_layer_5")] = 0.28; 
background_map[? layer_get_id("grass_layer_6")] = 0.32; 
background_map[? layer_get_id("grass_layer_7")] = 0.38; 
background_map[? layer_get_id("grass_layer_8")] = 0.42; 
background_map[? layer_get_id("grass_layer_9")] = 0.48; 
background_map[? layer_get_id("grass_layer_10")] = 0.58; 



// Array
arrayxoffset = [8,0,16,0,0,32,0,4,16,24];
xoffsetcounter = 0;