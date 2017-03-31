/// @description Player dodge state
/// player_state_dodge();

if (state_new) {
  dodge_distance = 30;
  sprite_state = "dodgingBegin";
}

vx = dodge_distance * facing;

dodge_distance = dodge_distance * 0.75;

if (dodge_distance <= 15) {
  sprite_state = "dodgingEnd";
}

if (dodge_distance <= 1) {
  state_switch("Idle");
}
