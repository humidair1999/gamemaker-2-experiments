/// @description Enemy pre-lunge state
/// enemy_state_prelunge();

// pause for random amount of time before moving to real lunge

if (state_new) {
  vx = 0;
  vy = 0;
  //tempAccel = groundAccel;
  //tempFric  = groundFric;
  sprite_state = "idling";
  image_blend = c_aqua;
  facing = sign(oPlayer.x - x);
  alarm[2] = 120;
}




if (alarm[2] <= 0) {
  state_switch("Lunge");
}




if (!collision_line(x - 200, y, x + 200, y, oPlayer, false, true)) {
  state_switch("Idle");
}

if (!onGround) {
  state_switch("Air");
}
