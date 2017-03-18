/// @description smooth collisions with surfaces
/// @param {pointer} collision_obj object to collide with

var collision_obj = argument0;

// if player is approaching Solid on the x axis
if (place_meeting(x + hspd, y, collision_obj)) {
    // while collision has not occurred on immediate next pixel
    while (!place_meeting(x + sign(hspd), y, collision_obj)) {
        // drastically slow player to 1px/step
        x += sign(hspd);
    }

    // when we break out of the while loop, this means a collision
    // has occurred and the speed should drop to 0
    hspd = 0;
}



if (place_meeting(x, y + vspd, collision_obj)) {
    while (!place_meeting(x, y + sign(vspd), collision_obj)) {
        y += sign(vspd);
    }

    vspd = 0;
}
