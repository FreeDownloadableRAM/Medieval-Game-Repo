// draw properties
draw_self();

// draw current score for debug purposes
draw_set_color(c_white);
draw_text(camera_get_view_x(view_camera[0]) + 1184,32, "allied score     : " + string(score_allies));
draw_text(camera_get_view_x(view_camera[0]) + 1184,48, "opposition score : " + string(score_opposition));
draw_text(camera_get_view_x(view_camera[0]) + 1184,64, "KoTH Ownership   : " + string(koth_ownership));