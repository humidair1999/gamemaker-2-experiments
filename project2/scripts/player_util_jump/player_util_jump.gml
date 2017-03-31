/// @description Utility script for Player jump
/// player_util_jump();

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
