/// run this for every frame
// so we run this till we get to the end
// no layers, we are tiling the ground!
if (current_generation_position < end_generation_boundaries + tile_size){
	
	//random_tree_offset =  (random_range(-4,4)) * 4;
	
	
	// we are on layer 1, pine trees
	// are we in boundaries, if yes, generate, if not reset current generation position
	
	// create
	// top
	//instance_create_layer(current_generation_position,map_height + top_ground_offset,"Ground",top_ground);
	//middle
	instance_create_layer(current_generation_position,map_height + middle_ground_offset,"Ground",middle_ground);
	// bottom
	//instance_create_layer(current_generation_position,map_height + bottom_ground_offset,"Ground",bottom_ground);
		
	current_generation_position = current_generation_position + tile_size;

}
else {
	
	instance_destroy();

}







