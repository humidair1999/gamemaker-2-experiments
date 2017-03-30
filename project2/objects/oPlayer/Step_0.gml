// Input //////////////////////////////////////////////////////////////////////

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

if (onGround) {  
  tempAccel = groundAccel;
  tempFric  = groundFric;
} else {
  tempAccel = airAccel;
  tempFric  = airFric;
}






state_execute();
