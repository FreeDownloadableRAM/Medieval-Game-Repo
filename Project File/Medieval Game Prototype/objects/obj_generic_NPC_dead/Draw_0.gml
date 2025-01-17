/// Dubugging purposes
// draw ourself
draw_self();

// draw debug text
if (global.dev_mode == true){
	draw_text(x - 16,y - 16, "Alarm 0: " + string(alarm_get(0)));
	draw_text(x - 16,y + 16, "Alarm 1: " + string(alarm_get(1)));
	draw_text(x - 16,y + 32, "frames per second: " + string(fps));
	
}
else{
	// Dont draw if we arent
	
}
