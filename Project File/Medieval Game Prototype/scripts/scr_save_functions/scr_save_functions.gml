// Save a variable

function save_game(){
	
	// save data to a struct
	
	var _struct = 
	{
		// save all the global variables into local variables WITHIN the struct
		// the struct acts like a big variable, an assortment of collected variables
		
		// campaign progress trackers
		lvl_1_clear : global.lvl_1_clear,
		lvl_2_clear : global.lvl_2_clear,
		lvl_3_clear : global.lvl_3_clear,
		lvl_4_clear : global.lvl_4_clear,
		lvl_5_clear : global.lvl_5_clear,
		lvl_6_clear : global.lvl_6_clear,
		lvl_7_clear : global.lvl_7_clear,
		lvl_8_clear : global.lvl_8_clear,
		lvl_9_clear : global.lvl_9_clear,
		lvl_10_clear : global.lvl_10_clear,
		lvl_11_clear : global.lvl_11_clear,
		lvl_12_clear : global.lvl_12_clear,
		lvl_13_clear : global.lvl_13_clear,
		lvl_14_clear : global.lvl_14_clear,
		lvl_15_clear : global.lvl_15_clear,
		lvl_16_clear : global.lvl_16_clear,
		lvl_17_clear : global.lvl_17_clear,
		lvl_18_clear : global.lvl_18_clear,
		
		// options trackers
		music_volume : global.music_amp_decimal,
		sound_volume : global.sound_effects_amp_decimal,
		music_slider_x : global.music_amp_slider_x,
		sound_slider_x : global.sound_effects_slider_x
	
	
	};
	
	// save the data into a json string
	var _string = json_stringify(_struct)
	
	// Open up and create the save file
	var _file = file_text_open_write("game_save_data.txt")
	
	// write the data into the text file
	file_text_write_string(_file, _string );
	
	file_text_close(_file);

}

// Load a save
function load_game(){
	
	// check if file exists
	if (file_exists("game_save_data.txt")){
		// open up that text file
		var _file = file_text_open_read("game_save_data.txt");
		
		// set that variable you wish to override with the saved value
		var _json = file_text_read_string(_file);
		
		// we have to convert the json format into our local struct format
		var _struct = json_parse(_json);
		
		// Now we have to set the games values to the ones from the save file
		global.lvl_1_clear = _struct.lvl_1_clear;
		global.lvl_2_clear = _struct.lvl_2_clear;
		global.lvl_3_clear = _struct.lvl_3_clear;
		global.lvl_4_clear = _struct.lvl_4_clear;
		global.lvl_5_clear = _struct.lvl_5_clear;
		global.lvl_6_clear = _struct.lvl_6_clear;
		global.lvl_7_clear = _struct.lvl_7_clear;
		global.lvl_8_clear = _struct.lvl_8_clear;
		global.lvl_9_clear = _struct.lvl_9_clear;
		global.lvl_10_clear = _struct.lvl_10_clear;
		global.lvl_11_clear = _struct.lvl_11_clear;
		global.lvl_12_clear = _struct.lvl_12_clear;
		global.lvl_13_clear = _struct.lvl_13_clear;
		global.lvl_14_clear = _struct.lvl_14_clear;
		global.lvl_15_clear = _struct.lvl_15_clear;
		global.lvl_16_clear = _struct.lvl_16_clear;
		global.lvl_17_clear = _struct.lvl_17_clear;
		global.lvl_18_clear = _struct.lvl_18_clear;
		
		// options
		// music
		global.music_amp_decimal = _struct.music_volume;
		global.music_amp_slider_x = _struct.music_slider_x;
		
		// sound
		global.sound_effects_amp_decimal = _struct.sound_volume;
		global.sound_effects_slider_x = _struct.sound_slider_x;
		
		// close the file 
		file_text_close(_file);
	
	
	}

}