/// Variables

// Inherit oParEntity variables
event_inherited();

facing = 1;

// Movement ///////////////////////////////////////////////////////////////////

groundAccel = 1.00;
groundFric  = 2.00;
airAccel    = 1.0;
airFric     = 0.25;
vxMax       = 3.0;
vyMax       = 14.0;
jumpHeight  = 10.0;
gravNorm    = 0.5;
//gravSlide   = 0.25; 

//clingTime   = 2.0;

hp = 100;
maxHp = 100;
stamina = 100;
maxStamina = 100;
isInvincible = false;

jumpStaminaCost = 10;
attackStaminaCost = 20;

// Misc ///////////////////////////////////////////////////////////////////////

// States
IDLE     = 10;
RUN      = 11;
JUMP     = 12;
//ROLL     = 13;

// Initialize properties
state  = IDLE;
facing = image_xscale; // Change xscale in editor to adjust initial facing

// For squash + stretch
//xscale = 1;
//yscale = 1;

///////////////////////////////////////////////////////////////////////////////

attacking = false;
//blocking  = false;

//fallTime = 0;
//fallMax  = 28;
