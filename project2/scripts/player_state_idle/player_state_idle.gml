/// @description Player idle state
/// player_state_idle();

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
            
          //yscale = 1.33;
          //xscale = 0.67;
        }
    }
// Variable jumping
} else if (kJumpRelease) { 
    if (vy < 0)
        vy *= 0.25;
}

if (kLeft || kRight /* && !sticking */) {
  state_switch("Walk");
}

if (!onGround) {
  state_switch("Air");
}
