/// properties of the icon clicked
// Unit Type
unit_train_type = obj_pikeman; // pikeman is default
unit_train_sprite = spr_pm_unit_icon;
unit_train_cd_object = obj_unit_train_cd;
unit_train_time = 300; // in fps (60 = 1 second)
unit_train_timer = 0; // in fps (60 = 1 second)
unit_train_cost = global.unit_pikeman_cost;

icon_width = 32;
icon_height = 32;

// spawn off set
unit_spawn_location_x = 0 + global.left_side_spawn_offset_x;
unit_spawn_location_y = global.spawn_height;

// UI Placement
unit_icon_placement_offset_x = 160;
unit_icon_placement_offset_y = 64;

// Auto Train
// Allow us to keep training units if we can afford it when toggled to avoid cramping players hand
auto_train = false;