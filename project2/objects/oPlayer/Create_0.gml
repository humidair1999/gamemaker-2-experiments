/// Variables

// Inherit oParEntity variables
event_inherited();

facing = 1;

// Movement ///////////////////////////////////////////////////////////////////

groundAccel = 1.50;
groundFric  = 1.75;
airAccel    = 1.0;
airFric     = 0.25;
vxMax       = 6.0;
vyMax       = 15.0;
jumpHeight  = 15.0;
gravNorm    = 1.0;
//gravSlide   = 0.25; 

//clingTime   = 2.0;

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

//attacking = false;
//blocking  = false;

//fallTime = 0;
//fallMax  = 28;
