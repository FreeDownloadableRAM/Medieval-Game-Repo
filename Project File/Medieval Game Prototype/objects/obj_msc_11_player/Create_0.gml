/// Set parameters of music playing
// Information regarding music so that it will loop properly

// Stop ALL audio FIRST
audio_stop_all();

// Track Info
music_bpm = 132; // beats per min, this is in quarternotes
beats_p_bar = 4; // 4 beats in a bar
beat_st_offset = 0; // beats before music starts playing in the track, THESE ARE IN QUARTER NOTES
amount_of_bars = 64; // amount of bars of music
loopable = true;

// Length = (# of bars * beats per bar) * (60 / BPM)
track_length = ((amount_of_bars * beats_p_bar) * (60 / music_bpm)) * 60;
track_timer = track_length;

// Audio track to play
music_track = snd_msc_11;


// play music track
// play track 
audio_play_sound(music_track,10,false);

// ost info
// main menu theme ():
// BPM: 94
// Beats per bar: 4
// # of Bars: 40 bars

// conflicting interests (msc 01)
// BPM: 112
// Beats per Bar: 4
// beat offset: 0
// # of Bars: 48

// medieval warfare (msc 02)
// BPM: 104
// Beats per Bar: 4
// beat offset: 0
// # of Bars: 52

// Liberty Awaits (msc 03) NOT LOOPABLE
// BPM: 117
// Beats per Bar: 4
// beat offset: 0
// # of Bars: n/a

// Standing orders (msc 04) 
// BPM: 124
// Beats per Bar: 3 (5/4 but to avoid having a fractional # of bars amount, just write here as 3)
// beat offset: 0
// # of Bars: 91

// Price Paid (msc 05) 
// BPM: 110
// Beats per Bar: 3 
// beat offset: 0
// # of Bars: 80

// Uphill Battle (msc 06) 
// BPM: 134
// Beats per Bar: 4 
// beat offset: 0
// # of Bars: 56 

// nearing journeys end (msc 07)
// BPM: 132
// Beats per Bar: 4
// beat offset: 0
// # of Bars: 96

// the elites (msc 08)
// BPM: 128
// Beats per Bar: 4
// beat offset: 0
// # of Bars: 56

// travel at night (msc 09)
// BPM: 122
// Beats per Bar: 4
// beat offset: 0
// # of Bars: 88

// Heroes Never Forgotten (msc 11)
// BPM: 132
// Beats per Bar: 4
// beat offset: 0
// # of Bars: 64

// Your Last War (msc 12)
// BPM: 170
// Beats per Bar: 4
// beat offset: 0
// # of Bars: 168

// Heroes Never Forgotten (msc 13)
// BPM: 114
// Beats per Bar: 7
// beat offset: 0
// # of Bars: 46

// Heroes Never Forgotten (msc 14)
// BPM: 153
// Beats per Bar: 11
// beat offset: 0
// # of Bars: 38

// Heroes Never Forgotten (msc 15)
// BPM: 116
// Beats per Bar: 4
// beat offset: 0
// # of Bars: 64