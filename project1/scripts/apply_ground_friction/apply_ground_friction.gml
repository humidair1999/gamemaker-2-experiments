/// @description apply ground friction to walking character
/// @param {real} friction_amt amount of friction to apply

var friction_amt = argument0;

// if character is walking
if (hspd != 0) {
  // if current moving speed (left or right) minus the friction amount
	// is greater than 0, apply the friction to the moving speed
  if (abs(hspd) - friction_amt > 0) {
    hspd -= friction_amt * image_xscale;
  }
  // otherwise, just stop the character
  else {
    hspd = 0;
  }
}
