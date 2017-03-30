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

if (vx == 0) {
  state_switch("Idle");
}

if (!onGround) {
  state_switch("Air");
}