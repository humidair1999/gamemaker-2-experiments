/// PlatformCheck();

/*
var counter = 10;
//var matched_frame = 0;

for (var i = 1; i <= counter; i += 1) {
  with (oParSolid) {
    if (place_meeting(x, y - other.vy + i, other) && !place_meeting(x, y, other)) {
      //matched_frame = i;
      //return true;
      
      while (!place_meeting(y - sign(hspd), y, other)) {
        // drastically slow player to 1px/step
        x += sign(hspd);
      }
      
      with (oParSolid) {
        if (place_meeting(x, y - sign(other.vy), other) && !place_meeting(x, y, other)) {
          //vy = 0;
          return true;
        }
      }
    }
  }
}
*/




    


/*
with (oParSolid) {
  if (place_meeting(x, y - sign(other.vy), other) && !place_meeting(x, y, other)) {
    //vy = 0;
    return true;
  }
}
*/

if (vy >= 0) {
  /*
  with (oParEntity) {
    if (place_meeting(x, y - 1, other) && !place_meeting(x, y, other)) {
        vy = 0;
    }
  }
  */
  
  with (oParSolid) {
    // 100 - (15 + 10)
    // = 75
    if (place_meeting(x, y - (other.vy + 5), other)) {
      while (!place_meeting(x, y - 1, other)) {
          // drastically slow player to 1px/step
          other.y += 1;
        }
  
      //vy = 0;
      return true;
    }
  }

  with (oParJumpThru) {
    if (place_meeting(x, y - (other.vy + 5), other) && !place_meeting(x, y, other)) {
        // Land
        //vy = 0;
        //other.platformTarget = id;
        //return true;
        
      while (!place_meeting(x, y - 1, other)) {
        // drastically slow player to 1px/step
        other.y += 1;
      }
  
      //vy = 0;
      return true;
    }
  }
}
else {
  with (oParSolid) {
    // 100 + -15 + 10
    // = 125
    if (place_meeting(x, y + (other.vy * -1), other)) {
      while (!place_meeting(x, y + 1, other)) {
          // drastically slow player to 1px/step
          other.y -= 1;
        }
  
      //vy = 0;
      return true;
    }
  }
}

platformTarget = 0;
return false;