jumped = false;
landed = false;

platformTarget = 0;
// wall targets, for wall slides?
//wallTarget     = 0;

// pushing, for pushing crates?
//push = false;

// Velocity
vx = 0;
vy = 0;

// Used for sub-pixel movement
cx = 0;
cy = 0;

onGround = OnGround();

// cling left and right, for wall slides?
/*
cLeft    = place_meeting(x - 1, y, oBlock);
cRight   = place_meeting(x + 1, y, oBlock);
*/