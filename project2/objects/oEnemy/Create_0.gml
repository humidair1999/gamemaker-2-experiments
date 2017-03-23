// Inherit oParEntity variables
event_inherited();

groundAccel = 1.00;
groundFric  = 2.00;
airAccel    = 1.0;
airFric     = 0.25;
vxMax       = 1.0;
vyMax       = 14.0;
jumpHeight  = 10.0;
gravNorm    = 0.5;

hp = 10;
maxHp = 10;

sight = 180;

// States
IDLE     = 10;
RUN      = 11;
CHASE    = 12;

// Initialize properties
state  = IDLE;
facing = image_xscale;

isInvincible = false;