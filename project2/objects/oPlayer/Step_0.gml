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







var spd_wanted = 0; //The wanted horizontal speed for this step

if(kLeft)
{
    spd_wanted -= 3;
}
if(kRight)
{
    spd_wanted += 3;
}

speed_x += (spd_wanted - speed_x) * 0.1; //Smoothly accelerate / decelerate to the wanted speed.

speed_y += grav; //Apply gravity

if(kJump && OnGround())
{
    speed_y = -6;
}















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
				/* else */ if (onGround && !kRight && !kLeft) {
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
if (sprite_index == sPlayerJab && round(image_index) > 0) {
    with (instance_create_layer(x, y, "PlayerLayer", oPlayerAtkBox)) {
        bboxleft  = min(other.x + (25 * other.facing), other.x + (50 * other.facing));
        bboxright = max(other.x + (25 * other.facing), other.x + (50 * other.facing));
        
        bboxtop    = other.y + 4;
        bboxbottom = other.y + 12; 
    }
}
