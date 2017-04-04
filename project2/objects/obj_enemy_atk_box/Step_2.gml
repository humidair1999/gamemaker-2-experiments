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

/*
with (oParCrate) {
    // Break crate
    if (!(bbox_left > other.bboxright || bbox_right < other.bboxleft || bbox_top > other.bboxbottom || bbox_bottom < other.bboxtop)) {
        instance_destroy();
    }
}

with (oEnemy) {
    // Damage enemy
    if (!(bbox_left > other.bboxright || bbox_right < other.bboxleft || bbox_top > other.bboxbottom || bbox_bottom < other.bboxtop)) {
        //instance_destroy();
        
        if (!isInvincible) {
          image_blend = c_red;
          
          hp -= 1;
          
          isInvincible = true;
          
          alarm[0] = 30;
        }
    }
}
*/
