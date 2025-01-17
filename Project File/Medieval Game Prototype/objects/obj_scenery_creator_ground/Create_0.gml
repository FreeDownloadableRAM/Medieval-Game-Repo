/// here we handle the logic for generating a background
// amount of layers
amount_of_layers = 8;
current_layer = 1;
// assets
top_ground = obj_dbg_ground;
middle_ground = obj_ground_dirt; 
bottom_ground = obj_dbg_ground;

// buffer zone
tile_size = 96;

current_generation_position = 0;


// starting and ending boundaries
start_generation_boundaries = 0; // starting border of the map (x = zero)
end_generation_boundaries = global.current_map_size_x;

// room height
map_height = global.current_map_size_y;
top_ground_offset = -96;
middle_ground_offset = -48;
bottom_ground_offset = -32;
