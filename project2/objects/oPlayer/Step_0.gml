// Input //////////////////////////////////////////////////////////////////////

kLeft        = keyboard_check(vk_left);
kRight       = keyboard_check(vk_right);
kUp          = keyboard_check(vk_up);
kDown        = keyboard_check(vk_down);

kJump        = keyboard_check_pressed(ord("C"));
kJumpRelease = keyboard_check_released(ord("C"));

kAction      = keyboard_check_pressed(ord("X"));
kDodge       = keyboard_check_pressed(ord("Z"));

// Movement ///////////////////////////////////////////////////////////////////








state_execute();
