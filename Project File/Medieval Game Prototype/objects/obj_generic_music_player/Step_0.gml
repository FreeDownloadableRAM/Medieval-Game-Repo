/// @description Control Audio Level
audio_sound_gain(music_track,global.music_amp_decimal,0);

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
