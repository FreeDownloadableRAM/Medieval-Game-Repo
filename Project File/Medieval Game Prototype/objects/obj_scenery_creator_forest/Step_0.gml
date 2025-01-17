/// run this for every frame
// so we run this till we get to the end
// first we find out which layer we are on
/*
if (current_layer == 1){
	
	//random_tree_offset =  (random_range(-4,4)) * 4;
	
	
	// we are on layer 1, pine trees
	// are we in boundaries, if yes, generate, if not reset current generation position
	if (current_generation_position <= end_generation_boundaries + end_generation_offset){
		// create
		instance_create_layer(current_generation_position,map_height,"Tree_Layer_1",pine_tree);
		instance_create_layer(current_generation_position + (pine_tree_buffer_zone/2),map_height,"Tree_Layer_5",pine_tree);
		current_generation_position = current_generation_position + pine_tree_buffer_zone + (random_tree_offset * 4);

	}
	else {
		// reset
		current_generation_position = start_generation_boundaries;
		current_layer += 1;
	}

}
else if (current_layer == 2){
	
	//random_tree_offset =  (random_range(-4,4)) * 4;
	
	
	// we are on layer 1, pine trees
	// are we in boundaries, if yes, generate, if not reset current generation position
	if (current_generation_position <= end_generation_boundaries + end_generation_offset){
		// create
		instance_create_layer(current_generation_position,map_height,"Tree_Layer_2",eastern_hemlock);
		instance_create_layer(current_generation_position + (eastern_hemlock_buffer_zone/2),map_height,"Tree_Layer_6",eastern_hemlock);
		current_generation_position = current_generation_position + eastern_hemlock_buffer_zone + (random_tree_offset * 4);

	}
	else {
		// reset
		current_generation_position = start_generation_boundaries;
		current_layer += 1;
	}

}
else if (current_layer == 3){
	
	//random_tree_offset =  (random_range(-4,4)) * 4;
	
	
	// we are on layer 1, pine trees
	// are we in boundaries, if yes, generate, if not reset current generation position
	if (current_generation_position <= end_generation_boundaries + end_generation_offset){
		// create
		instance_create_layer(current_generation_position,map_height,"Tree_Layer_3",western_larch);
		instance_create_layer(current_generation_position + (western_larch_buffer_zone/2),map_height,"Tree_Layer_7",western_larch);
		current_generation_position = current_generation_position + western_larch_buffer_zone + (random_tree_offset * 4);

	}
	else {
		// reset
		current_generation_position = start_generation_boundaries;
		current_layer += 1;
	}

}
else if (current_layer == 4){
	
	//random_tree_offset =  (random_range(-4,4)) * 4;
	
	
	// we are on layer 1, pine trees
	// are we in boundaries, if yes, generate, if not reset current generation position
	if (current_generation_position <= end_generation_boundaries + end_generation_offset){
		// create
		instance_create_layer(current_generation_position,map_height,"Tree_Layer_4",ginkgo_biloba);
		instance_create_layer(current_generation_position + (ginkgo_biloba_buffer_zone/2),map_height,"Tree_Layer_8",ginkgo_biloba);
		instance_create_layer(current_generation_position + (ginkgo_biloba_buffer_zone/4),map_height,"Tree_Layer_9",ginkgo_biloba);
		instance_create_layer(current_generation_position + (ginkgo_biloba_buffer_zone/2) + (ginkgo_biloba_buffer_zone/4),map_height,"Tree_Layer_10",ginkgo_biloba);
		current_generation_position = current_generation_position + ginkgo_biloba_buffer_zone + (random_tree_offset * 4);

	}
	else {
		// reset
		current_generation_position = start_generation_boundaries;
		current_layer += 1;
	}

}

else {
	instance_destroy();

}

*/




