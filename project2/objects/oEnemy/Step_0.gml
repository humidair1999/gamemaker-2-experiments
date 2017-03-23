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
    var dis = point_distance(x, y, oPlayer.x, oPlayer.y);
    
    if (dis < sight) {
        state = CHASE;
    }
}









if (state == IDLE) {
  if (onGround) {
    state = RUN;
  }
}
else if (state == RUN) {
  if (facing == -1) {
    // Apply acceleration left
    if (vx > 0)
        vx = Approach(vx, 0, tempFric);
				
    vx = Approach(vx, -vxMax, tempAccel);
    
    if !collision_point(bbox_left - 40, bbox_bottom + 1, oParSolid, false, true)
      facing = 1;
  }
  else {
    // Apply acceleration right
    if (vx < 0)
        vx = Approach(vx, 0, tempFric);
				
    vx = Approach(vx, vxMax, tempAccel);
    
    if !collision_point(bbox_right + 40, bbox_bottom + 1, oParSolid, false, true)
      facing = -1;
  }
}
else if (state == CHASE) {
  if (instance_exists(oPlayer)) {
    var dir = point_direction(x, y, oPlayer.x, y);
    var dis = point_distance(x, y, oPlayer.x, oPlayer.y);
    
    if (dir > 0) {
      facing = -1;
      
      vx = Approach(vx, -vxMax, tempAccel);
    }
    else {
      facing = 1;
      
      vx = Approach(vx, vxMax, tempAccel);
    }
    
    if (dis > sight) {
        state = IDLE;
    }
  }
}

















