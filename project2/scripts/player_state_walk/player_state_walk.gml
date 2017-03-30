/// @description Player walk state
/// player_state_walk();

if (state_new) {
    sprite_state = "walking";
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

if (vx == 0) {
  state_switch("Idle");
}

if (/* !kBlock && */ kAction) {
    if (!attacking) {
        // Attack out of roll
				/*
        if (onGround && state == ROLL) {
            image_index  = 0;
            image_speed  = 0.5;
            sprite_index = sPlayerRollSlash;
            
            alarm[1]  = 8; 
            attacking = true;       
        // Jab in place
				// see source file for proper comment
        }
				*/
				/* else */ if (onGround && stamina >= attackStaminaCost) {
          stamina -= attackStaminaCost;
            
          attacking = true;
          
          state_switch("Attack");
        }
    }
}

if (kJump) { 
    if (onGround) {
        // Fall thru platform
        if (kDown) {
            if ((collision_line(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, oParJumpThru, false, true) &&
		            !collision_line(bbox_left, bbox_bottom, bbox_right, bbox_bottom, oParJumpThru, false, true)))
                ++y;
        } else if (stamina >= jumpStaminaCost) {
          stamina -= jumpStaminaCost;
        
          vy = -jumpHeight;
          
          state_switch("Air");
            
          //yscale = 1.33;
          //xscale = 0.67;
        }
    }
}

if (!onGround) {
  state_switch("Air");
}