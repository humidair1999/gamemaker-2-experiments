/// @description Utility script for Player attack
/// player_util_attack();

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
