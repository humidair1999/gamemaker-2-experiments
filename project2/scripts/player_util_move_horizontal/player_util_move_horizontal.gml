/// @description Script to move Player horizontally
/// player_util_move_horizontal();

if (kLeft && !kRight /* && !sticking */) {
    facing = -1;
    
    // Apply acceleration left
    if (vx > 0)
        vx = approach(vx, 0, tempFric);
				
    vx = approach(vx, -vxMax, tempAccel);
// Right
// right movement logic for while not sticking to wall
} else if (kRight && !kLeft /* && !sticking */) {
    facing = 1;
    
    // Apply acceleration right
    if (vx < 0)
        vx = approach(vx, 0, tempFric);
				
    vx = approach(vx, vxMax, tempAccel);
}

if ((!kRight && !kLeft)) {
    vx = approach(vx, 0, tempFric);
}
