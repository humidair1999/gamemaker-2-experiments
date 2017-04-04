/// @description Enemy lunge state
/// enemy_state_lunge();

// pause for steady amount of time before executing lunge

if (state_new) {
  vx = 0;
  vy = 0;
  //tempAccel = groundAccel;
  //tempFric  = groundFric;
  sprite_state = "lunge";
  image_blend = c_orange;
  // TODO: 0 makes the sprite literally disappear
  facing = sign(oPlayer.x - x);
  lunge_distance = 30;
  alarm[3] = 30;
}




if (alarm[3] <= 0) {
  //facing = sign(oPlayer.x - x);
  
  sprite_state = "lungeAttack";
  
  if (!instance_exists(attackBox)) {
    attackBox = instance_create_layer(x + (40 * facing), y, "EnemiesLayer", oEnemyAtkBox);
    
    with (attackBox) {
      image_xscale = 1;
      image_yscale = 1;
    }
  }
  else {
    with (attackBox) {
      x = other.x + (40 * other.facing);
    }
  }
  
  vx = lunge_distance * facing;

  lunge_distance = lunge_distance * 0.75;
  
  if (lunge_distance <= 1) {
    state_switch("Prelunge");
  }
}









if (!onGround) {
  state_switch("Air");
}
