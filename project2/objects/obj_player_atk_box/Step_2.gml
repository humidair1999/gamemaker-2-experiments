/*
with (oParGrass) {
    if (!cut) {
    // Chop grass
    if (!(bbox_left > other.bboxright || bbox_right < other.bboxleft || bbox_top > other.bboxbottom || bbox_bottom < other.bboxtop)) {
            GrassCut();
            xskew = round(random_range(2, 4)) * choose(-1, 1);
        }
        
        alarm[0] = 3;
        cut = true;
    }
}
*/

with (obj_parent_crate) {
    // Break crate
    if (place_meeting(x, y, other)) {
        instance_destroy();
    }
}

with (obj_enemy) {
    // Damage enemy
    if (place_meeting(x, y, other)) {
        //instance_destroy();
        
        if (!isInvincible) {
          image_blend = c_red;
          
          hp -= 1;
          
          isInvincible = true;
          
          alarm[0] = 30;
        }
    }
}
