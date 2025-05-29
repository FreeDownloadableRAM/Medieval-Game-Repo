/// Here we keep track of mouse position
// movement

new_x_position = mouse_x;
new_y_position = mouse_y;

x = new_x_position;
y = new_y_position;

// dont move outside bounds
// right limit
if (x > global.current_map_size_x){
	x = global.current_map_size_x;

}
// left limit
if (x < 0){
	x = 0;

}
