/// @description Enemy idle state
/// enemy_state_idle();

if (state_new) {
    vx = 0;
    vy = 0;
    sprite_state = "idling";
    alarm[0] = 40;
}

if (alarm[0] <= 0) {
  state_switch("Wander");
}

if (!onGround) {
  state_switch("Air");
}
