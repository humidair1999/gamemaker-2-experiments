/// @description Enemy idle state
/// enemy_state_idle();

if (state_new) {
    vx = 0;
    vy = 0;
    sprite_state = "idling";
}

if (!onGround) {
  state_switch("Air");
}
