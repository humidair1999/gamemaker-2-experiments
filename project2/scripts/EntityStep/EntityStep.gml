/// EntityStep();



var xsp = round(speed_x); //Turn the theoretical value into an integer for collision and movement

//Horizontal collision
if(place_meeting(x + xsp, y, oParSolid))
{
    while(!place_meeting(x + sign(xsp), y, oParSolid))
    {
        x += sign(xsp);
    }
    xsp     = 0;
    speed_x = 0; //We still have to set the theoretical value to 0 here
}
x += xsp;






var ysp = round(speed_y); //Turn the theoretical value into an integer for collision and movement

//Vertical collision
if(place_meeting(x, y + ysp, oParSolid)) {
    while(!place_meeting(x, y + sign(ysp), oParSolid)) {
        y += sign(ysp);
    }
    ysp     = 0
    speed_y = 0; //We still have to set the theoretical value to 0 here
}
else if (ysp > 0) {
  platformTarget = instance_place(x, y + ysp, oParJumpThru);
  
  if (instance_exists(platformTarget) && !place_meeting(x, y, platformTarget)) {
    //if (platformTarget) {
        while(!place_meeting(x, y + sign(ysp), platformTarget)) {
          y += sign(ysp);
        }
        ysp     = 0
        speed_y = 0; //We still have to set the theoretical value to 0 here
    //}
  }
  
  
  




    /*
    with (oParJumpThru) {
      if(place_meeting(x, y - ysp, other) && !place_meeting(x, y, other)) {
        while(!place_meeting(x, y - 1, other)) {
          other.y += 1;
        }
      ysp     = 0
      speed_y = 0; //We still have to set the theoretical value to 0 here
      }
    }
    */
    
    
  /*
  while(!place_meeting(x, y + sign(ysp), oParJumpThru))
    {
        y += sign(ysp);
    }
    ysp     = 0
    speed_y = 0; //We still have to set the theoretical value to 0 here
  */
}
y += ysp;









/*
jumped = false;
landed = false;

if (vy < 1 && vy > -1)
    PlatformCheck();
else
    repeat(abs(vy)) {
        if (!PlatformCheck())
            y += sign(vy);
        else
            break;
    }

if (platformTarget) {
    if (!onGround)
        landed = true;
    
    if (landed)
        with (platformTarget) other.vy = 0;
    else
        with (platformTarget) other.vy = 0;
}

repeat(abs(vx)) {
		// slope logic???
    //if (place_meeting(x + sign(vx), y, oParSolid) && !place_meeting(x + sign(vx), y - 1, oParSolid))
        //y -= 1;
         
    //if (place_meeting(x + sign(vx), y + 2, oParSolid) && !place_meeting(x + sign(vx), y + 1, oParSolid))
        //y += 1;
        
    if (!place_meeting(x + sign(vx), y, oParSolid))
        x += sign(vx);
    else
        vx = 0;
}
*/