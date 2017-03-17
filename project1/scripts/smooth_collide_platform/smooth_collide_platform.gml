/// @description smooth collisions with platforms
/// @param {pointer} collision_obj object to collide with

var collision_obj = argument0;

if (vspd > 0) {
//if (!place_meeting(x, y, collision_obj)) {
			//platform = "YES";
			platform = instance_place(x, y + vspd, collision_obj);
			
			if (platform != noone) {
				if (bbox_bottom <= platform.bbox_top) {
					should_land = true;
					
					while (!place_meeting(x, y + sign(vspd), platform)) {
						y += sign(vspd);
					}
					
					vspd = 0;
				}
			}
		//}
}
