return place_meeting(x, y + 1, obj_parent_solid) ||
		(collision_line(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, obj_parent_jump_thru, false, true) &&
		!collision_line(bbox_left, bbox_bottom, bbox_right, bbox_bottom, obj_parent_jump_thru, false, true));
