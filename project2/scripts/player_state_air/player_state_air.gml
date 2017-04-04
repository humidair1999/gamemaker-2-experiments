/// @description Player is in the air
/// player_state_air();

if (state_new) {
  tempAccel = airAccel;
  tempFric  = airFric;
}

if (vy <= 0) {
  sprite_state = "jumping";
}
else {
  sprite_state = "falling";
}

vy = approach(vy, vyMax, gravNorm);

// Variable jumping
if (kJumpRelease) { 
    if (vy < 0)
        vy *= 0.25;
}

player_util_move_horizontal();

if (onGround) {
  if (vx == 0) {
    state_switch("Idle");
  }
  else {
    state_switch("Walk");
  }
}
