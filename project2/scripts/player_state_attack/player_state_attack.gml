/// @description Player attack state
/// player_state_attack();

if (state_new) {
    vx = 0;
    vy = 0;
    image_index = 0;
    sprite_state = "attacking";
}

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
if (sprite_index == sPlayerJab && round(image_index) == 3) {
    with (instance_create_layer(x, y, "PlayerLayer", oPlayerAtkBox)) {
        bboxleft  = min(other.x + (25 * other.facing), other.x + (50 * other.facing));
        bboxright = max(other.x + (25 * other.facing), other.x + (50 * other.facing));
        
        bboxtop    = other.y + 4;
        bboxbottom = other.y + 12; 
    }
}