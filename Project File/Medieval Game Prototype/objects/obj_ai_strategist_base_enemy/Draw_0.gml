// draw debug text
if (global.dev_mode == true){
	
	
}
else{

}

// we draw this regardless
draw_set_color(c_white);
/*
	draw_text(camera_get_view_x(view_camera[0]) + 1280,y + 80, "Player Order: " + string(global.player_order));
	draw_text(camera_get_view_x(view_camera[0]) + 1280,y + 64, "Enemy AI Order: " + string(global.enemy_order));
	draw_text(camera_get_view_x(view_camera[0]) + 1248,y + 176, "Enemy unit amount: " + string(global.player_unit_count_enemy));
	draw_text(camera_get_view_x(view_camera[0]) + 1248,y + 160, "Enemy Army Order:  " + string(global.enemy_order));
	
	// Economic Trackers
	draw_text(camera_get_view_x(view_camera[0]) + 1248,y + 144, "Enemy G. Amnt:   " + string(global.enemy_gold_amount));
	draw_text(camera_get_view_x(view_camera[0]) + 1248,y + 128, "Enemy G.Cap:     " + string(global.enemy_gold_cap));
	draw_text(camera_get_view_x(view_camera[0]) + 1248,y + 112, "Enemy G. Gen:    " + string((global.enemy_gold_gen*(ai_eco_lv * ai_eco_lv))+global.enemy_gold_gen));
	draw_text(camera_get_view_x(view_camera[0]) + 1248,y + 96, "Enemy G. S. Amnt: " + string(global.enemy_gold_start_amount));
	
	// Gold gen
	draw_text(camera_get_view_x(view_camera[0]) + 1248,y + 194, "Alarm 6 Timer: " + string(alarm_get(6)));
	
	// Player army trackers
	draw_text(camera_get_view_x(view_camera[0]) + 1248,y + 210, "P. Army. sm #: " + string(p_sm_amount));
	draw_text(camera_get_view_x(view_camera[0]) + 1248,y + 226, "P. Army. pm #: " + string(p_pm_amount));
	draw_text(camera_get_view_x(view_camera[0]) + 1248,y + 242, "P. Army. rg #: " + string(p_rg_amount));
	draw_text(camera_get_view_x(view_camera[0]) + 1248,y + 258, "P. Army. kn #: " + string(p_kn_amount));
	draw_text(camera_get_view_x(view_camera[0]) + 1248,y + 274, "P. Army. ab #: " + string(p_ab_amount));
	draw_text(camera_get_view_x(view_camera[0]) + 1248,y + 290, "P. Army. hb #: " + string(p_hb_amount));
	
	// Player army composition trackers
	draw_text(camera_get_view_x(view_camera[0]) + 1248,y + 306, "P. Army. rg_to_ml rat.: " + string(p_army_range_to_melee_ratio));
	
	// AI army trackers
	draw_text(camera_get_view_x(view_camera[0]) + 963,y + 112, "AI. Army. sm #: " + string(global.enemy_sm_count));
	draw_text(camera_get_view_x(view_camera[0]) + 963,y + 128, "AI. Army. pm #: " + string(global.enemy_pm_count));
	draw_text(camera_get_view_x(view_camera[0]) + 963,y + 144, "AI. Army. rg #: " + string(global.enemy_rg_count));
	draw_text(camera_get_view_x(view_camera[0]) + 963,y + 160, "AI. Army. kn #: " + string(global.enemy_kn_count));
	draw_text(camera_get_view_x(view_camera[0]) + 963,y + 176, "AI. Army. ab #: " + string(global.enemy_ab_count));
	draw_text(camera_get_view_x(view_camera[0]) + 963,y + 192, "AI. Army. hb #: " + string(global.enemy_hb_count));
	
	// AI threshold
	draw_text(camera_get_view_x(view_camera[0]) + 963,y + 210, "P. Army. range thres: " + string(cntr_p_army_range_thres));
	draw_text(camera_get_view_x(view_camera[0]) + 963,y + 226, "P. Army. sm thres: " + string(cntr_p_army_sm_thres));
	draw_text(camera_get_view_x(view_camera[0]) + 963,y + 242, "P. Army. pm thres: " + string(cntr_p_army_pm_thres));
	draw_text(camera_get_view_x(view_camera[0]) + 963,y + 258, "P. Army. rg thres: " + string(cntr_p_army_rg_thres));
	draw_text(camera_get_view_x(view_camera[0]) + 963,y + 274, "P. Army. kn thres: " + string(cntr_p_army_kn_thres));
	draw_text(camera_get_view_x(view_camera[0]) + 963,y + 290, "P. Army. ab thres: " + string(cntr_p_army_ab_thres));
	draw_text(camera_get_view_x(view_camera[0]) + 963,y + 306, "P. Army. hb thres: " + string(cntr_p_army_hb_thres));
	
	
	
	// AI type
	draw_text(camera_get_view_x(view_camera[0]) + 963,y + 96, "AI Type: " + string(ai_type));
	
	// AI eco saving
	draw_text(camera_get_view_x(view_camera[0]) + 963,y + 80, "AI wants to save up: " + string(ai_eco_up_save));
	draw_text(camera_get_view_x(view_camera[0]) + 963,y + 64, "AI eco save roll:    " + string(ai_upgrade_econ_chance));
	
	// Ai restrict order toggle
	draw_text(camera_get_view_x(view_camera[0]) + 688,y + 96, "AI restricted: " + string(ai_restrict_attack_order));
	draw_text(camera_get_view_x(view_camera[0]) + 688,y + 112, "AI restrict timer: " + string(alarm_get(9)));
	
	// What eco level are you at?
	draw_text(camera_get_view_x(view_camera[0]) + 688,y + 80, "Eco Level: " + string(ai_eco_lv));
	
	// What is the ai doing in its step code?
	draw_text(camera_get_view_x(view_camera[0]) + 32,y + 196, "AI Thought: " + string(ai_choice));
	
	// What is the ai percentages
	draw_text(camera_get_view_x(view_camera[0]) + 688,y + 196, "AI range army %: " + string(ai_ranged_army_percent));
	draw_text(camera_get_view_x(view_camera[0]) + 688,y + 212, "AI King HP %: " + string(ai_king_health));
	draw_text(camera_get_view_x(view_camera[0]) + 688,y + 244, "AI King HP: " + string(global.player_castle_health_enemy));
	draw_text(camera_get_view_x(view_camera[0]) + 688,y + 272, "AI Patience: " + string(ai_patience));
	
	// AI order thought
	draw_text(camera_get_view_x(view_camera[0]) + 688,y + 228, "AI Order sit.: " + string(ai_order_situation));
	
	// training alarms
	draw_text(camera_get_view_x(view_camera[0]) + 32,y + 212, "SM alarm: " + string(alarm_get(0)));
	draw_text(camera_get_view_x(view_camera[0]) + 32,y + 228, "PM alarm: " + string(alarm_get(1)));
	draw_text(camera_get_view_x(view_camera[0]) + 32,y + 244, "RG alarm: " + string(alarm_get(2)));
	draw_text(camera_get_view_x(view_camera[0]) + 160,y + 212, "KN alarm: " + string(alarm_get(3)));
	draw_text(camera_get_view_x(view_camera[0]) + 160,y + 228, "AB alarm: " + string(alarm_get(4)));
	draw_text(camera_get_view_x(view_camera[0]) + 160,y + 244, "HB alarm: " + string(alarm_get(5)));
*/

/*
	// debug for delta time purposes
	draw_set_color(c_white);
	draw_text(x+720,y + 264, "ai patience: " + string(ai_patience));
	draw_text(x+720,y + 280, "AI Attack delay Timer: " + string(alarm_get(9)));
	draw_text(x+720,y + 312, "delta time value: " + string(delta_time/1000000));
*/