/// PlatformCheck();

var y_speed = argument0;

if (place_meeting(x, y + y_speed, obj_parent_solid)) {
  while (!place_meeting(x, y + sign(y_speed), obj_parent_solid)) {
    y += sign(y_speed);
  }

  return true;
}

if (y_speed > 0) {
  with (obj_parent_jump_thru) {
    if (place_meeting(x, y - y_speed, other) && !place_meeting(x, y, other)) {
      while (!place_meeting(x, y - 1, other)) {
        other.y += 1;
      }

      return true;
    }
  }
}

return false;
