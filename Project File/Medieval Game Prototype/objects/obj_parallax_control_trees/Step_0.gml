//Get the camera view

var _cx = camera_get_view_x(view_camera[0]);

if (object_exists(obj_player_controller) == true){

	//var _xspd = round(obj_player_controller.x);
	var _xspd = 0;
	_cx += _xspd
	camera_set_view_pos(view_camera[0], _cx, 0);
	
	
	/*
	var _b = ds_map_find_first(background_map);
	repeat(ds_map_size(background_map))
	    {
			layer_x(_b, background_map[? _b] * (_cx));
			_b = ds_map_find_next(background_map, _b);
		
			
	    }
	*/
	
	//do each layer individually for offsets
	layer_x(layer_get_id("Tree_Layer_1_1"), (background_map[? layer_get_id("Tree_Layer_1_1")] * (_cx)) + arrayxoffset[0]);
	layer_x(layer_get_id("Tree_Layer_2_1"), (background_map[? layer_get_id("Tree_Layer_2_1")] * (_cx)) + arrayxoffset[1]);
	layer_x(layer_get_id("Tree_Layer_3_1"), (background_map[? layer_get_id("Tree_Layer_3_1")] * (_cx)) + arrayxoffset[2]);
	layer_x(layer_get_id("Tree_Layer_4_1"), (background_map[? layer_get_id("Tree_Layer_4_1")] * (_cx)) + arrayxoffset[3]);
	layer_x(layer_get_id("Tree_Layer_5_1"), (background_map[? layer_get_id("Tree_Layer_5_1")] * (_cx)) + arrayxoffset[4]);
	layer_x(layer_get_id("Tree_Layer_6_1"), (background_map[? layer_get_id("Tree_Layer_6_1")] * (_cx)) + arrayxoffset[5]);
	
	layer_x(layer_get_id("Tree_Layer_7_1"), (background_map[? layer_get_id("Tree_Layer_7_1")] * (_cx)) + arrayxoffset[6]);
	layer_x(layer_get_id("Tree_Layer_8_1"), (background_map[? layer_get_id("Tree_Layer_8_1")] * (_cx)) + arrayxoffset[7]);
	layer_x(layer_get_id("Tree_Layer_8_1_2"), (background_map[? layer_get_id("Tree_Layer_8_1_2")] * (_cx)) + arrayxoffset[8]);
	layer_x(layer_get_id("Tree_Layer_9_1"), (background_map[? layer_get_id("Tree_Layer_9_1")] * (_cx)) + arrayxoffset[9]);
	layer_x(layer_get_id("Tree_Layer_10_1"), (background_map[? layer_get_id("Tree_Layer_10_1")] * (_cx)) + arrayxoffset[10]);
	
	layer_x(layer_get_id("Distant_Background_1"), (background_map[? layer_get_id("Distant_Background_1")] * round((_cx)) + arrayxoffset[11]));
	layer_x(layer_get_id("Distant_Background_2"), (background_map[? layer_get_id("Distant_Background_2")] * round((_cx)) + arrayxoffset[12]));
	layer_x(layer_get_id("Distant_Background_3"), (background_map[? layer_get_id("Distant_Background_3")] * round((_cx)) + arrayxoffset[13]));
	layer_x(layer_get_id("Distant_Background_4"), (background_map[? layer_get_id("Distant_Background_4")] * round((_cx)) + arrayxoffset[14]));
	layer_x(layer_get_id("Furthest_Background"), (background_map[? layer_get_id("Furthest_Background")] * round((_cx)) + arrayxoffset[15]));
	layer_x(layer_get_id("Skybox"), (background_map[? layer_get_id("Skybox")] * round((_cx)) + arrayxoffset[16]));
	
	
	
}

