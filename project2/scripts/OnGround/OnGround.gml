/// OnGround();

//return place_meeting(x, y + 1, oParSolid) || (place_meeting(x, y + 1, oParJumpThru) && !place_meeting(x, y, oParJumpThru));

return place_meeting(x, y + 1, oParSolid) ||
		(collision_line(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, oParJumpThru, false, true) &&
		!collision_line(bbox_left, bbox_bottom, bbox_right, bbox_bottom, oParJumpThru, false, true));
