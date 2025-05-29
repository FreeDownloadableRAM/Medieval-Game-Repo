//Get the camera view

var _cx = camera_get_view_x(view_camera[0]);

if (object_exists(obj_player_controller) == true){

	//var _xspd = round(obj_player_controller.x);
	var _xspd = 0;
	_cx += _xspd
	//camera_set_view_pos(view_camera[0], _cx, 0);
	
	
	/*
	var _b = ds_map_find_first(background_map);
	repeat(ds_map_size(background_map))
	    {
			layer_x(_b, background_map[? _b] * (_cx));
			_b = ds_map_find_next(background_map, _b);
		
			
	    }
	*/
	
	//do each layer individually for offsets
	layer_x(layer_get_id("grass_layer_1"), (background_map[? layer_get_id("grass_layer_1")] * (_cx)) + arrayxoffset[0]);
	layer_x(layer_get_id("grass_layer_2"), (background_map[? layer_get_id("grass_layer_2")] * (_cx)) + arrayxoffset[1]);
	layer_x(layer_get_id("grass_layer_3"), (background_map[? layer_get_id("grass_layer_3")] * (_cx)) + arrayxoffset[2]);
	layer_x(layer_get_id("grass_layer_4"), (background_map[? layer_get_id("grass_layer_4")] * (_cx)) + arrayxoffset[3]);
	layer_x(layer_get_id("grass_layer_5"), (background_map[? layer_get_id("grass_layer_5")] * (_cx)) + arrayxoffset[4]);
	
	layer_x(layer_get_id("grass_layer_6"), (background_map[? layer_get_id("grass_layer_6")] * (_cx)) + arrayxoffset[5]);
	layer_x(layer_get_id("grass_layer_7"), (background_map[? layer_get_id("grass_layer_7")] * (_cx)) + arrayxoffset[6]);
	layer_x(layer_get_id("grass_layer_8"), (background_map[? layer_get_id("grass_layer_8")] * (_cx)) + arrayxoffset[7]);
	layer_x(layer_get_id("grass_layer_9"), (background_map[? layer_get_id("grass_layer_9")] * (_cx)) + arrayxoffset[8]);
	layer_x(layer_get_id("grass_layer_10"), (background_map[? layer_get_id("grass_layer_10")] * (_cx)) + arrayxoffset[9]);
	
	
	
}

