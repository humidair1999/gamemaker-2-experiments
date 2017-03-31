/// @description Player walk state
/// player_state_walk();

if (state_new) {
  tempAccel = groundAccel;
  tempFric  = groundFric;
  sprite_state = "walking";
}

player_util_move_horizontal();

if (vx == 0) {
  state_switch("Idle");
}

player_util_attack();

player_util_jump();

if (!onGround) {
  state_switch("Air");
}