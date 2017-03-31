/// @description Player idle state
/// player_state_idle();

if (state_new) {
    vx = 0;
    vy = 0;
    sprite_state = "idling";
}

if (kLeft || kRight /* && !sticking */) {
  state_switch("Walk");
}

player_util_attack();

player_util_jump();

if (!onGround) {
  state_switch("Air");
}
