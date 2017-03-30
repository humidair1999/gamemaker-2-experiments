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
