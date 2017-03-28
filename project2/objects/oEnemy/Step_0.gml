var dis = 0;
var dir = 0;
var isMeetingLeft = 0;
var isMeetingRight = 0;



if (onGround) {  
  tempAccel = groundAccel;
  tempFric  = groundFric;
} else {
  tempAccel = airAccel;
  tempFric  = airFric;
}

// Handle gravity
if (!onGround) {
  // Fall normally
  vy = Approach(vy, vyMax, gravNorm);
}





if (instance_exists(oPlayer)) {
  dis = point_distance(x, y, oPlayer.x, oPlayer.y);
  dir = point_direction(x, y, oPlayer.x, y);
  isMeetingLeft = place_meeting(x - sight, y, oPlayer);
  isMeetingRight = place_meeting(x + sight, y, oPlayer);
}







switch (state) {
  case IDLE:
    vx = 0;
    
    break;
  case RUN:
    if (onGround) {
      if (facing == -1) {
        // Apply acceleration left
        if (vx > 0)
            vx = Approach(vx, 0, tempFric);

        vx = Approach(vx, -vxMax, tempAccel);

        if (!collision_point(bbox_left - 40, bbox_bottom + 1, oParSolid, false, true) &&
            !collision_point(bbox_left - 40, bbox_bottom + 1, oParJumpThru, false, true)) {
          facing = 1;
        }
      }
      else {
        // Apply acceleration right
        if (vx < 0)
            vx = Approach(vx, 0, tempFric);

        vx = Approach(vx, vxMax, tempAccel);

        if (!collision_point(bbox_right + 40, bbox_bottom + 1, oParSolid, false, true) &&
            !collision_point(bbox_right + 40, bbox_bottom + 1, oParJumpThru, false, true)) {
          facing = -1;
        }
      }

      if (dis != 0 && dis < sight) {
        state = CHASE;
      }
    }

    break;
  case CHASE:
    var chanceToLeap = random(100);
  
    if (dir == 180) {
      facing = -1;
      
      if (chanceToLeap < 5 & onGround) {
        vx = -10;
        vy = -8;
      }
      else {
        vx = Approach(vx, -vxMax, tempAccel);
      }
    }
    else if (dir == 0) {
      facing = 1;
      
      if (chanceToLeap < 5 & onGround) {
        vx = 10;
        vy = -8;
      }
      else {
        vx = Approach(vx, vxMax, tempAccel);
      }
    }
    
    if (dis != 0 && dis <= 60) {
      vx = 0;
      
      state = ATTACK;
    }
    
    if (dis != 0 && dis > sight) {
        state = RUN;
    }
    
    break;
  case ATTACK:
    state = IDLE;
    
    alarm[1] = 30;
    
    break;
}












with (oEnemyAtkBox)
    instance_destroy();


if (sprite_index == sPlayerJab && round(image_index) == 2) {
    with (instance_create_layer(x, y, "EnemiesLayer", oEnemyAtkBox)) {
        bboxleft  = min(other.x + (25 * other.facing), other.x + (50 * other.facing));
        bboxright = max(other.x + (25 * other.facing), other.x + (50 * other.facing));
        
        bboxtop    = other.y + 4;
        bboxbottom = other.y + 12; 
    }
}









