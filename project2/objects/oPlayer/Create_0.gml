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







kLeft = false;
kRight = false;
kUp = false;
kDown = false;
kJump = false;
kJumpRelease = false;
kAction = false;
kDodge = false;
/* kBlock, kRollL, kRollR, */

tempAccel = 0;
tempFric = 0;











///Setup State Machine for Platform Boy
state_machine_init();

//Define States
state_create("Idle", player_state_idle);
state_create("Walk", player_state_walk);
state_create("Air", player_state_air);
state_create("Dodge", player_state_dodge);
state_create("Attack", player_state_attack);
//Set the default state
state_init("Idle");




sprite_state = "idling";




