/// @description Enemy wander state
/// enemy_state_wander();

var facing_random;
var isFloorToRight, isFloorToLeft;
var isWallToRight, isWallToLeft;

if (state_new) {
  vx = 0;
  vy = 0;
  tempAccel = groundAccel;
  tempFric  = groundFric;
  sprite_state = "idling";
  alarm[1] = 240;
  // TODO: 0 makes the sprite literally disappear
  facing_random = random_range(-10, 10);
  facing = sign(facing_random);
  image_blend = c_green;
}

isFloorToRight = (collision_point(bbox_right + 40, bbox_bottom + 1, oParSolid, false, true) ||
                  collision_point(bbox_right + 40, bbox_bottom + 1, oParJumpThru, false, true));
isFloorToLeft = (collision_point(bbox_left - 40, bbox_bottom + 1, oParSolid, false, true) ||
                 collision_point(bbox_left - 40, bbox_bottom + 1, oParJumpThru, false, true));

isWallToRight = place_meeting(x + 40, y, oParSolid);
isWallToLeft = place_meeting(x - 40, y, oParSolid);





if ((facing == 1) && isFloorToRight && !isWallToRight) {
  // Apply acceleration right
  if (vx < 0)
      vx = Approach(vx, 0, tempFric);
      
  sprite_state = "walking";

  vx = Approach(vx, vxMax, tempAccel);
}
else if ((facing == -1) && isFloorToLeft && !isWallToLeft) {
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



// switch to lunge
if (collision_line(x - 200, y, x + 200, y, oPlayer, false, true)) {
  state_switch("Prelunge");
}





if (!onGround) {
  state_switch("Air");
}





