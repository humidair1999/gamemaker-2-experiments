/// Variables

// Inherit oParEntity variables
event_inherited();


// Movement ///////////////////////////////////////////////////////////////////

groundAccel = 1.00;
groundFric  = 2.00;
airAccel    = 1.0;
airFric     = 0.25;
vxMax       = 3.0;
vyMax       = 14.0;
jumpHeight  = 10.0;
gravNorm    = 0.5;


hp = 100;
maxHp = 100;
stamina = 100;
maxStamina = 100;
isInvincible = false;

jumpStaminaCost = 6;
dodgeStaminaCost = 12;
attackStaminaCost = 10;


facing = image_xscale; // Change xscale in editor to adjust initial facing


attackBox = noone;

///////////////////////////////////////////////////////////////////////////////

attacking = false;







kLeft = false;
kRight = false;
kUp = false;
kDown = false;
kJump = false;
kJumpRelease = false;
kAction = false;
kDodge = false;

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




