// Input //////////////////////////////////////////////////////////////////////

var kLeft, kRight, kUp, kDown, kJump, kJumpRelease, kAction, /* kBlock, kRollL, kRollR, */ tempAccel, tempFric;

kLeft        = keyboard_check(vk_left);
kRight       = keyboard_check(vk_right);
kUp          = keyboard_check(vk_up);
kDown        = keyboard_check(vk_down);

kJump        = keyboard_check_pressed(vk_space);
kJumpRelease = keyboard_check_released(vk_space);

kAction      = keyboard_check_pressed(vk_control);
//kBlock       = keyboard_check(ord('C'))          || gamepad_button_check(0, gp_face2);
//kRollL       = keyboard_check_pressed(ord('A'))  || gamepad_button_check_pressed(0, gp_shoulderlb);
//kRollR       = keyboard_check_pressed(ord('D'))  || gamepad_button_check_pressed(0, gp_shoulderrb);

// Movement ///////////////////////////////////////////////////////////////////

// Apply the correct form of acceleration and friction
if (onGround) {  
  tempAccel = groundAccel;
  tempFric  = groundFric;
} else {
  tempAccel = airAccel;
  tempFric  = airFric;
}

// Handle gravity
if (!onGround) {
  vy = Approach(vy, vyMax, gravNorm);
}

// movement logic for while not rolling
/*
if (state != ROLL) {
*/
// Left 
// left movement logic for while not sticking to wall
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
/*
}
*/

// Friction
if ((!kRight && !kLeft) || attacking) {
    vx = Approach(vx, 0, tempFric);
    
		/*
    if (state != ROLL)
		*/
        state = IDLE;
} 
       
 
// Jump 
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

// Jump state
if (!onGround)
    state = JUMP;
// Run particles
/*
else if (random(100) > 85 && abs(vx) > 0.5)
    instance_create(x, y + 8, oParticlePlayer);
*/



// Roll
/*
if (onGround && !attacking) {
    if (state != ROLL) {
        if (kRollL) {
            facing = -1;
            
            image_index  = 0;
            image_speed  = 0.5;
            sprite_index = sPlayerRoll;
            
            state = ROLL;
        } else if (kRollR) {
            facing = 1;
            
            image_index  = 0;
            image_speed  = 0.5;
            sprite_index = sPlayerRoll;
            
            state = ROLL;
        }
    }
}
*/

// Roll speed
/*
if (state == ROLL) {
    vx = facing * 6;
    
    // Break out of roll
    if (!onGround || (cLeft || cRight)) {
        state = IDLE;
        if (!attacking)
            alarm[1] = -1;
    }
}
*/
    
// Action
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
        
          image_index  = 0;
          image_speed  = 1;
          sprite_index = sPlayerJab;
            
          attacking = true;
        }
    }
}

/*
blocking = kBlock;
*/









// CODE FROM ADDITIONAL STEP EVENT IN SOURCE!!!

/// Hitbox

with (oPlayerAtkBox)
    instance_destroy();

// Dash out of roll
/*
if (sprite_index == sPlayerRollSlash) {    
    with (instance_create(x, y, oPlayerAtkBox)) {
        bboxleft  = min(other.x + (5 * other.facing), other.x + (24 * other.facing));
        bboxright = max(other.x + (5 * other.facing), other.x + (24 * other.facing));
        
        bboxtop    = other.y - 1;
        bboxbottom = other.y + 8; 
    }
}*/
    
// Jab
if (sprite_index == sPlayerJab && round(image_index) == 2) {
    with (instance_create_layer(x, y, "PlayerLayer", oPlayerAtkBox)) {
        bboxleft  = min(other.x + (25 * other.facing), other.x + (50 * other.facing));
        bboxright = max(other.x + (25 * other.facing), other.x + (50 * other.facing));
        
        bboxtop    = other.y + 4;
        bboxbottom = other.y + 12; 
    }
}







state_execute();
