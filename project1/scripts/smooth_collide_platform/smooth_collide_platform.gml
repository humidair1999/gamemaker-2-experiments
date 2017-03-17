/// @description smooth collisions with platforms
/// @param {pointer} collision_obj object to collide with

var collision_obj = argument0;

// Collision Bottom
if (vspd > 0) {
	var found_platform = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + vspd, collision_obj, false, true);
	
	platform = found_platform;
	
	if ((found_platform != noone) && (bbox_bottom <= found_platform.bbox_top)) {
		while (!collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, found_platform, false, true)) {
			y += 1;
		}
		
		//y = found_platform.bbox_top;
		
		play_bbox = bbox_bottom;
		plat_bbox = found_platform.bbox_top;

		vspd = 0;
	}
}

//if (vspd > 0) {
//if (!place_meeting(x, y, collision_obj)) {
			//platform = "YES";
			//platform = instance_place(x, y + vspd, collision_obj);
			
			//if (platform != noone) {
				//if (bbox_bottom <= platform.bbox_top) {
					//should_land = true;
					
					//while (!place_meeting(x, y + sign(vspd), platform)) {
						//y += sign(vspd);
					//}
					
					//vspd = 0;
				//}
			//}
		//}
//}
