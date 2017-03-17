/// @description player move state

var will_not_be_on_surface = !place_meeting(x, y + 1, obj_surface);
//var will_not_be_on_surface = !collision_line(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, obj_surface, false, true)
//var will_not_be_on_platform = !collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, obj_platform, false, true);
var will_not_be_on_platform = !collision_line(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, obj_platform, false, true);

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

if (will_not_be_on_surface && will_not_be_on_platform) {
    vspd += grav;
    
    //sprite_index = spr_player_jump;
    //image_speed = 0;
    
    if (vspd > 0) {
        //image_index = 1;
				
				status = "falling";
    }
    else {
        //image_index = 0;
				
				status = "jumping";
    }
    
    // player has pressed (and released) the up key and
    // is still traveling up; "dampening" the jump mid-air
    if (up_released && vspd < -8) {
        vspd = -8;
    }
}
else {
    if (hspd == 0) {
        //sprite_index = spr_player_idle;
				status = "idle";
    }
    else {
        //sprite_index = spr_player_walk;
        //image_speed = 0.6;
				status = "running";
    }

    if (up) {
        vspd = -20;
        
        //audio_play_sound(snd_jump, 5, false);
    }
    else {
        vspd = 0;
    }
}



smooth_collide_surface(obj_surface);
smooth_collide_platform(obj_platform);

x += hspd;
y += vspd;

var bbox_width = (bbox_right + 1) - bbox_left;
var bbox_height = (bbox_bottom + 1) - bbox_top;

x = clamp(x, bbox_width, room_width - bbox_width);
y = clamp(y, bbox_height, room_height - 1);

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
