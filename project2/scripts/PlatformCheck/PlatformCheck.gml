/// PlatformCheck();

with (oParSolid) {
  if (place_meeting(x, y - sign(other.vy), other) && !place_meeting(x, y, other)) {
    //vy = 0;
    return true;
  }
}

if (vy > 0) {
  /*
  with (oParEntity) {
    if (place_meeting(x, y - 1, other) && !place_meeting(x, y, other)) {
        vy = 0;
    }
  }
  */

  with (oParJumpThru) {
    if (place_meeting(x, y - 1, other) && !place_meeting(x, y, other)) {
        // Land
        //vy = 0;
        other.platformTarget = id;
        return true;
    }
  }
}

platformTarget = 0;
return false;