/// Entity Step 2.0
/// see source file for "entity step 2.0" - we're using using the oParEntity
/// parent event, which calls EntityStep()!

event_inherited();

with (obj_enemy_atk_box) {
    // Enemy damage player
    if (place_meeting(x, y, other)) {
        //instance_destroy();
        
        if (other.state_name != "Dodge" && !other.isInvincible) {
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
  stamina += 2;
  
  alarm[7] = 20;
}








state_update();
