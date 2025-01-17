/// here we handle the flickers
if (global.is_game_paused == true){

	// If game is paused, do nothing


}
else {
	
	//Is death animation playing?
	if (alarm_get(1) > 0){

		

	}
	else{
		// Flicker
		if (alarm_get(0) > 120){

			sprite_index = dead_body_sprite;

		}
		else if (alarm_get(0) < 121 && alarm_get(0) > 105){

			sprite_index = invisible_sprite;

		}
		else if (alarm_get(0) < 106 && alarm_get(0) > 90){

			sprite_index = dead_body_sprite;

		}
		else if (alarm_get(0) < 91 && alarm_get(0) > 75){

			sprite_index = invisible_sprite;

		}
		else if (alarm_get(0) < 76 && alarm_get(0) > 60){

			sprite_index = dead_body_sprite;

		}
		else if (alarm_get(0) < 61 && alarm_get(0) > 50){

			sprite_index = invisible_sprite;

		}
		else if (alarm_get(0) < 51 && alarm_get(0) > 40){

			sprite_index = dead_body_sprite;

		}
		else if (alarm_get(0) < 41 && alarm_get(0) > 30){

			sprite_index = invisible_sprite;

		}
		else if (alarm_get(0) < 31 && alarm_get(0) > 25){

			sprite_index = dead_body_sprite;

		}
		else if (alarm_get(0) < 26 && alarm_get(0) > 20){

			sprite_index = invisible_sprite;

		}
		else if (alarm_get(0) < 21 && alarm_get(0) > 15){

			sprite_index = dead_body_sprite;

		}
		else if (alarm_get(0) < 16 && alarm_get(0) > 10){

			sprite_index = invisible_sprite;

		}
		else if (alarm_get(0) < 11 && alarm_get(0) > 8){

			sprite_index = dead_body_sprite;

		}
		else if (alarm_get(0) < 9 && alarm_get(0) > 6){

			sprite_index = invisible_sprite;

		}
		else if (alarm_get(0) < 7 && alarm_get(0) > 4){

			sprite_index = dead_body_sprite;

		}
		else if (alarm_get(0) == 3){

			sprite_index = invisible_sprite;

		}
		else if (alarm_get(0) == 2){

			sprite_index = dead_body_sprite;

		}
		else{

			sprite_index = invisible_sprite;

		}
	}
	
	
}



