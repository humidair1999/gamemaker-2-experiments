/// @description player move state

var is_midair = !place_meeting(x, y + 1, obj_surface);

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

// vertical movement
if (is_midair) {
  vspd += grav;
    
  if (vspd > 0) {
    status = "falling";
  }
  else {
    status = "jumping";
  }
    
  // player has pressed (and released) the up key and
  // is still traveling up; "dampening" the jump mid-air
  if (up_released && vspd < -8) {
    vspd = -8;
  }
}
else {
	if (up) {
    vspd = -20;
  }
	else {
		vspd = 0;
		
		status = "idle";
		
		if (hspd != 0) {
			status = "running";
		}
	}
}

smooth_collide_surface(obj_surface);

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
