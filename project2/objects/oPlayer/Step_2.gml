/// Entity Step 2.0
/// see source file for "entity step 2.0" - we're using using the oParEntity
/// parent event, which calls EntityStep()!

/// EntityStep();

event_inherited();

with (oEnemyAtkBox) {
    // Enemy damage player
    if (!(bboxleft > other.bbox_right || bboxright < other.bbox_left || bboxtop > other.bbox_bottom || bboxbottom < other.bbox_top)) {
        //instance_destroy();
        
        if (!other.isInvincible) {
          other.image_blend = c_red;
          
          other.hp -= 10;
          
          other.isInvincible = true;
          
          other.alarm[0] = 30;
        }
    }
}

if (hp <= 0) {
  instance_destroy();
}

if (stamina < maxStamina && alarm[7] <= 0) {
  stamina += 10;
  
  alarm[7] = 100;
}








state_update();
