/// @description initialize player

spd = 8;
acc = 1.2;
grav = 1.5;
hspd = 0;
vspd = 0;

status = "idle";
ply_status = "grounded";

platform = "";
should_land = false;

platform_below = false;
in_loop = false;

play_bbox = 0;
plat_bbox = 0;

state = player_move_state;