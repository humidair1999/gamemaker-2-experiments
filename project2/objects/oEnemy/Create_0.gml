// Inherit oParEntity variables
event_inherited();

vyMax       = 15.0;
gravNorm    = 1.0;

hp = 10;
maxHp = 10;

// States
IDLE     = 10;

// Initialize properties
state  = IDLE;
facing = image_xscale;

isInvincible = false;