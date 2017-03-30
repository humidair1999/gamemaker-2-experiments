/// @description Player is in the air
/// player_state_air();

vy = Approach(vy, vyMax, gravNorm);

// Variable jumping
if (kJumpRelease) { 
    if (vy < 0)
        vy *= 0.25;
}

if (vy <= 0) {
  sprite_state = "jumping";
}
else {
  sprite_state = "falling";
}

if (kLeft && !kRight /* && !sticking */) {
    facing = -1;
    state = RUN;
    
    // Apply acceleration left
    if (vx > 0)
        vx = Approach(vx, 0, tempFric);
				
    vx = Approach(vx, -vxMax, tempAccel);
// Right
// right movement logic for while not sticking to wall
} else if (kRight && !kLeft /* && !sticking */) {
    facing = 1;
    state = RUN;
    
    // Apply acceleration right
    if (vx < 0)
        vx = Approach(vx, 0, tempFric);
				
    vx = Approach(vx, vxMax, tempAccel);
}

if ((!kRight && !kLeft) || attacking) {
    vx = Approach(vx, 0, tempFric);
    
		/*
    if (state != ROLL)
		*/
        state = IDLE;
}

if (onGround) {
  if (vx == 0) {
    state_switch("Idle");
  }
  else {
    state_switch("Walk");
  }
}
