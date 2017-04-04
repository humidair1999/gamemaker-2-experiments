/// EntityStep();

var xsp = round(vx); //Turn the theoretical value into an integer for collision and movement

if (place_meeting(x + xsp, y, obj_parent_solid)) {
  while (!place_meeting(x + sign(xsp), y, obj_parent_solid)) {
    x += sign(xsp);
  }

  vx = 0;
  xsp = 0;
}

x += xsp;

var ysp = round(vy);

if (platform_check(ysp)) {
  vy = 0;
  ysp = 0;
}
else {
  y += ysp;
}
