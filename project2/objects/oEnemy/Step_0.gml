var dis = 0;
var dir = 0;
var isMeetingLeft = 0;
var isMeetingRight = 0;
var isInLineOfSight = noone;
var disToPlayer = 0;






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
  isInLineOfSight = collision_line(x - 200, y, x + 200, y, oPlayer, false, true)
  disToPlayer = distance_to_object(oPlayer);
}





// if player is in line of sight, within set distance
// lunge in direction of player, stopping at player's bounding box
// then pause for a bit before trying again









if (isInLineOfSight != noone || lunging) {
  image_blend = c_aqua;
  
  if (!lunging) {
    facing = sign(oPlayer.x - x);
  }
  
  if (alarm[5] <= 0) {
    //facing = sign(oPlayer.x - x);
    
    if (lungedDistance < lungeMax) {
      if (facing == -1) {
        lunging = true;
        x -= lungeStep;
        lungedDistance += lungeStep;
      }
      else {
        lunging = true;
        x += lungeStep;
        lungedDistance += lungeStep;
      }
    }
    else {
      lungedDistance = 0;
  
      alarm[5] = 100;
    }
  }
  
    // player to left
    //if (dir == 180) {
      //vx = disToPlayer * -1;
      
      //vx = Approach(vx, -vxMax, tempAccel);
      //vx = (disToPlayer / 60) * -1;
      //vy = -4
      
      //vx = sign(oPlayer.x - x) * 10;
      
      //while (!place_meeting(x - 1, y, oPlayer)) {
      /*
      if (x != playerXPos) {
        vx += sign(playerXPos - x);
      }
      else {
        vx = 0;
        
        playerXPos = -1;
        alarm[5] = 200;
      }
      */
      //}

      //vx = 0;
      //xsp = 0;
    //}
    // player to right
    //else if (dir == 0) {
      //vx = disToPlayer;
      
      //vx = Approach(vx, vxMax, tempAccel);
      //vx = (disToPlayer / 60);
    //}
}
else {
  image_blend = c_white;
  
  vx = Approach(vx, 0, tempFric);
}







/*
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
*/











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









