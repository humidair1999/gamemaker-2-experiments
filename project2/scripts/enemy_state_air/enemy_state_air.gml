/// @description Enemy is in the air
/// enemy_state_air();

if (state_new) {
  vx = 0;
  vy = 0;
  //tempAccel = airAccel;
  //tempFric  = airFric;
  
  with (attackBox)
    instance_destroy();
}


sprite_state = "falling";

vy = Approach(vy, vyMax, gravNorm);



//player_util_move_horizontal();

if (onGround) {
  state_switch("Idle");
}
