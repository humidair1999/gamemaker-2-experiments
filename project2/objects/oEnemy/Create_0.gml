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
ATTACK   = 13;

// Initialize properties
state  = RUN;
facing = image_xscale;

attacking = false;

isInvincible = false;

attackBox = noone;

lungedDistance = 0;
lungeStep = 8;
lungeMax = 150;
lunging = false;









///Setup State Machine for Platform Boy
state_machine_init();

//Define States
state_create("Idle", enemy_state_idle);
state_create("Wander", enemy_state_wander);
state_create("Air", enemy_state_air);
//state_create("Dodge", player_state_dodge);
//state_create("Attack", player_state_attack);
//Set the default state
state_init("Idle");




sprite_state = "idling";