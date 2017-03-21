// Handle gravity
if (!onGround) {
		// wall slide logic while falling
		/*
    if ((cLeft || cRight) && vy >= 0) {
        // Wall slide
        vy = Approach(vy, vyMax, gravSlide);
    } else {
		*/
        // Fall normally
        vy = Approach(vy, vyMax, gravNorm);
		/*
    }
		*/
}

if (hp <= 0) {
  instance_destroy();
}

