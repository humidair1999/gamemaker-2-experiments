/// @description smooth collisions with platforms
/// @param {pointer} collision_obj object to collide with

var collision_obj = argument0;

if (vspd > 0) {
	if (collision_line(bbox_left, bbox_bottom + vspd, bbox_right, bbox_bottom + vspd, collision_obj, false, true)) {
		while (!collision_line(bbox_left, bbox_bottom + sign(vspd), bbox_right, bbox_bottom + sign(vspd), collision_obj, false, true)) {
        y += sign(vspd);
    }

    vspd = 0;
	}



	//if (place_meeting(x, y + vspd, collision_obj)) {
    //while (!place_meeting(x, y + sign(vspd), collision_obj)) {
      //y += sign(vspd);
    //}

    //vspd = 0;
	//}
}

