/// @description Player is in the air
/// player_state_air();

vy = Approach(vy, vyMax, gravNorm);

if (onGround) {
  state_switch("Idle");
}
