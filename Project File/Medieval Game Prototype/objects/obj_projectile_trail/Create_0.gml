/// projectile properties
animation_fps = 16;
animation_frame_duration = 16;

animation_time = (animation_frame_duration/animation_fps)*fps;

alarm_set(0,animation_time); // 1 second
