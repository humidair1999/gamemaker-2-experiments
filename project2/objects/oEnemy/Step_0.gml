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
  isMeetingLeft = place_meeting(x - dis, y, oPlayer);
  isMeetingRight = place_meeting(x + dis, y, oPlayer);
}







switch (state) {
  case IDLE:
    vx = 0;
    
    break;
  case RUN:
    var chanceToPause = random(1000);
  
    if (onGround) {
      if (chanceToPause < 5 && alarm[4] <= 0) {
        state = IDLE;

        alarm[4] = random(120);
      }
      else {
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

        // if distance < 180 && there's a potential collision with player
        if ((dis != 0 && dis < sight) && (isMeetingLeft || isMeetingRight)) {
          state = CHASE;
        }
      }
    }

    break;
  case CHASE:
    if (dis <= 60) {
      vx = 0;
      
      if (dir == 0) {
        facing = 1;
      }
      else {
        facing = -1;
      }
      
      state = ATTACK;
    }
    else if (dis <= sight) {
      var chanceToLeap = random(100);
  
      if (dir == 180 && isMeetingLeft) {
        facing = -1;
      
        if (chanceToLeap < 3 && onGround) {
          vx = -10;
          vy = -4;
        }
        else {
          vx = Approach(vx, -vxMax, tempAccel);
        }
      }
      else if (dir == 0 && isMeetingRight) {
        facing = 1;
      
        if (chanceToLeap < 3 && onGround) {
          vx = 10;
          vy = -4;
        }
        else {
          vx = Approach(vx, vxMax, tempAccel);
        }
      }
    }
    else {
      state = RUN;
    }
    
    break;
  case ATTACK:
    state = IDLE;
    
    alarm[1] = 30;
    
    break;
}












with (attackBox)
    instance_destroy();


if (sprite_index == sPlayerJab && round(image_index) == 2) {
  attackBox = instance_create_layer(x, y, "EnemiesLayer", oEnemyAtkBox);
  
  with (attackBox) {
    bboxleft  = min(other.x + (25 * other.facing), other.x + (50 * other.facing));
    bboxright = max(other.x + (25 * other.facing), other.x + (50 * other.facing));
        
    bboxtop    = other.y + 4;
    bboxbottom = other.y + 12; 
  }
}









