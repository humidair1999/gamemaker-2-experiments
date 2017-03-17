/// @description player move state

var will_not_be_on_surface = !place_meeting(x, y + 1, obj_surface);
var will_not_be_on_platform = !place_meeting(x, y + 1, obj_platform);
//var will_not_be_on_platform = !collision_line(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, obj_platform, false, false);

//var was_within_platform = place_meeting(xprevious, yprevious + 1, obj_platform) || (vspd < 0);
//var will_not_intersect = !collision_line(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, obj_platform, false, true) && (vspd > 0);



var status = "";

// horizontal movement
if (right || left) {
	// TODO: could probably turn this into an apply_ground_acceleration
	// script
  hspd += (right - left) * acc;
  // hspd_dir = right - left;
	
	//sprite_index = spr_player_run;
    
  if (hspd > spd) {
    hspd = spd;
  }
  else if (hspd < -spd) {
    hspd = -spd;
  }
	
	image_xscale = sign(hspd);
}
else {
	apply_ground_friction(acc);
}








vspd += grav;

if (up) {
	vspd = -20;
	
	//status = "jumping";
	
	//ply_status = "jumping";
}

if (vspd > 0) {
	//ply_status = "jumping";
	
	//status = "falling";
	
	// Collision Bottom
	var found_platform = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + vspd, obj_platform, false, true);
	
	if (found_platform != noone) {
		platform_below = true;
	
		while (!collision_rectangle(bbox_left, bbox_bottom + sign(vspd), bbox_right, bbox_bottom + sign(vspd), found_platform, false, true)) {
			y += sign(vspd);
			
			in_loop = true;
			
			if (y == yprevious) {
				//break;
			}
		}
		
		in_loop = false;

		vspd = 0;
	}
	else {
		platform_below = false;
	}
}








// vertical movement
// gravity applies:
// if you're not on a surface AND not on OR inside a platform
if (vspd < 0) {
	
	// player has pressed (and released) the up key and
  // is still traveling up; "dampening" the jump mid-air
  if (up_released && vspd < -8) {
    vspd = -8;
  }
}


	
	

	
//else {
	//if (up) {
    //vspd = -20;
  //}
	//else {
		//vspd = 0;
		
		//status = "idle";
		
		//if (hspd != 0) {
			//status = "running";
		//}
	//}
//}

smooth_collide_surface(obj_surface);
//smooth_collide_platform(obj_platform);

x += hspd;
y += vspd;

// draw sprite depending on player's current status
switch(status) {
  case "falling":
		image_speed = 0;
		sprite_index = spr_player_run;
		image_index = 6;
	
		break;
	case "jumping":
		image_speed = 0;
		sprite_index = spr_player_run;
		image_index = 3;
	
		break;
	case "idle":
		image_speed = 1;
		sprite_index = spr_player_idle;
	
		break;
	case "running":
		image_speed = 1;
		sprite_index = spr_player_run;
	
		break;
	default:
		status = "";
		
		break;
}
