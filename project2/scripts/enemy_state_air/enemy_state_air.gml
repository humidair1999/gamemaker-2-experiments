/// @description Enemy is in the air
/// enemy_state_air();

if (state_new) {
  //tempAccel = airAccel;
  //tempFric  = airFric;
}


sprite_state = "falling";

vy = Approach(vy, vyMax, gravNorm);



//player_util_move_horizontal();

if (onGround) {
  state_switch("Idle");
}
