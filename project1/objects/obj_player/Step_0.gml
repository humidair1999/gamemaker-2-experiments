/// @description player step event

right = keyboard_check(vk_right);
left = keyboard_check(vk_left);

if (right || left) {
  hspd += (right - left) * acc;
  // hspd_dir = right - left;
	
	sprite_index = spr_player_run;
    
  if (hspd > spd) {
    hspd = spd;
  }
  else if (hspd < -spd) {
    hspd = -spd;
  }
	
	image_xscale = sign(hspd);
}
else {
	sprite_index = spr_player_idle;
	
	hspd = 0;
}

x += hspd;
