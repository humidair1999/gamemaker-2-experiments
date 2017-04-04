/// @description Enemy lunge state
/// enemy_state_lunge();

// pause for steady amount of time before executing lunge

if (state_new) {
  vx = 0;
  vy = 0;
  //tempAccel = groundAccel;
  //tempFric  = groundFric;
  sprite_state = "lunge";
  image_blend = c_orange;
  facing = sign(oPlayer.x - x);
  lunge_distance = 30;
  alarm[3] = 30;
}




if (alarm[3] <= 0) {
  //facing = sign(oPlayer.x - x);
  
  sprite_state = "lungeAttack";
  
  vx = lunge_distance * facing;

  lunge_distance = lunge_distance * 0.75;
  
  if (lunge_distance <= 1) {
    state_switch("Prelunge");
  }
}









if (!onGround) {
  state_switch("Air");
}
