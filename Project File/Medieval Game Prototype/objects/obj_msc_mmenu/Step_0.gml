/// @description Control Audio Level
audio_sound_gain(music_track,global.music_amp_decimal,0);

// DO NOT play in any room other than menus
if (room != rm_main_menu && room != rm_play_menu && room != rm_lvl_select
		&& room != rm_vs_ai_menu_allies && room != rm_vs_ai_menu_enemy
			&& room != rm_vs_ai_menu_map && room != rm_vs_ai_menu_opposition
				&& room != rm_vs_ai_menu_player){
	// reset track timer
	track_timer = 0;
	
}
// We can play
else {
	// if we are set to loop, worry about this, if not, dont
	if (loopable == true){

		// timer // length is as long as a beat in frames
		track_timer = track_timer - (1 * ((delta_time / 1000000) * 60));
	
		if (track_timer <= 0){
			// reset timer
			track_timer = track_length;
		
			// play sound
			audio_play_sound(music_track,10,false);
	
		}

		// handle loops
		// Length = (# of bars * beats per bar) * (60 / BPM)
	
	

	}
}