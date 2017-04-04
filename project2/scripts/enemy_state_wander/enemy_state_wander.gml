/// @description Enemy wander state
/// enemy_state_wander();

var facing_random;

if (state_new) {
  vx = 0;
  vy = 0;
  tempAccel = groundAccel;
  tempFric  = groundFric;
  sprite_state = "idling";
  alarm[1] = 240;
  facing_random = random_range(-10, 10);
  facing = sign(facing_random);
}








if ((facing == 1) &&
    (collision_point(bbox_right + 40, bbox_bottom + 1, oParSolid, false, true) ||
     collision_point(bbox_right + 40, bbox_bottom + 1, oParJumpThru, false, true))) {
  // Apply acceleration right
  if (vx < 0)
      vx = Approach(vx, 0, tempFric);
      
  sprite_state = "walking";

  vx = Approach(vx, vxMax, tempAccel);
}
else if ((facing == -1) &&
    (collision_point(bbox_left - 40, bbox_bottom + 1, oParSolid, false, true) ||
     collision_point(bbox_left - 40, bbox_bottom + 1, oParJumpThru, false, true))) {
  // Apply acceleration left
  if (vx > 0)
      vx = Approach(vx, 0, tempFric);
      
  sprite_state = "walking";

  vx = Approach(vx, -vxMax, tempAccel);
}
else {
  state_switch("Idle");
}



if (alarm[1] <= 0) {
  state_switch("Idle");
}




if (!onGround) {
  state_switch("Air");
}





