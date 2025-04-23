/// We use this object to control the parralax effect
// In the room editor, the background layer must have horizontal tile enabled
// Viewport 0 enabled
// Viewport 0 Visible checked

//Create map
background_map = ds_map_create();

background_map[? layer_get_id("Tree_Layer_1_1")] = 0.1; 
background_map[? layer_get_id("Tree_Layer_2_1")] = 0.15; 
background_map[? layer_get_id("Tree_Layer_3_1")] = 0.2; 
background_map[? layer_get_id("Tree_Layer_4_1")] = 0.25; 
background_map[? layer_get_id("Tree_Layer_5_1")] = 0.3; 
background_map[? layer_get_id("Tree_Layer_6_1")] = 0.35; 
background_map[? layer_get_id("Tree_Layer_7_1")] = 0.4; 
background_map[? layer_get_id("Tree_Layer_8_1")] = 0.45; 
background_map[? layer_get_id("Tree_Layer_8_1_2")] = 0.45; 
background_map[? layer_get_id("Tree_Layer_9_1")] = 0.5; 
background_map[? layer_get_id("Tree_Layer_10_1")] = 0.6; 
background_map[? layer_get_id("Distant_Background_1")] = 0.7; // Can only use the values between 0 and 1
background_map[? layer_get_id("Distant_Background_2")] = 0.75; // Can only use the values between 0 and 1
background_map[? layer_get_id("Distant_Background_3")] = 0.8; // Can only use the values between 0 and 1
background_map[? layer_get_id("Distant_Background_4")] = 0.85; // Can only use the values between 0 and 1
background_map[? layer_get_id("Furthest_Background")] = 0.9; // Can only use the values between 0 and 1
background_map[? layer_get_id("Skybox")] = 0.95; // Higher the fraction, the further it is away


// Array
arrayxoffset = [180,48,64,194,156,128,0,98,-94,0,2,0,0,0,0,0,0];
xoffsetcounter = 0;