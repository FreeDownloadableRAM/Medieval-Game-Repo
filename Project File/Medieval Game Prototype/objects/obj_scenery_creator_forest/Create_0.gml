/// here we handle the logic for generating a background
// amount of layers
amount_of_layers = 8;
current_layer = 1;
// assets
eastern_hemlock = obj_eastern_hemlock;
pine_tree = obj_pine_tree;
ginkgo_biloba = obj_ginkgo_biloba;
western_larch = obj_western_larch;

// buffer zone
eastern_hemlock_buffer_zone = 192; // minimum of 192 in between trees on this layer
pine_tree_buffer_zone = 256; // minimum of 256 in between trees on this layer
ginkgo_biloba_buffer_zone = 432; // minimum of 432 in between trees on this layer
western_larch_buffer_zone = 128; // minimum of 256 in between trees on this layer

// current tree offset
random_tree_offset = 0;


// starting and ending boundaries
start_generation_boundaries = 0; // starting border of the map (x = zero)
start_generation_offset = -256; // start a little bit off of the map to the left
end_generation_boundaries = global.current_map_size_x;
end_generation_offset = 256;
current_generation_position = 0;

// room height
map_height = global.current_map_size_y - 96;
