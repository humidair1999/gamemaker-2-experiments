/// EntityStep();

var xsp = round(vx); //Turn the theoretical value into an integer for collision and movement

if (place_meeting(x + xsp, y, oParSolid)) {
  while (!place_meeting(x + sign(xsp), y, oParSolid)) {
    x += sign(xsp);
  }

  vx = 0;
  xsp = 0;
}

x += xsp;

var ysp = round(vy);

if (PlatformCheck(ysp)) {
  vy = 0;
  ysp = 0;
}
else {
  y += ysp;
}
