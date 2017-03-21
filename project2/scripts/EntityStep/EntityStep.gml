/// EntityStep();

//jumped = false;
//landed = false;


/*
if (vy > 0) {
	below_box = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + vy, oParSolid, false, true);
	
	if ((below_box != noone)) {
		while (!place_meeting(x, y + sign(vy), below_box)) {
        y += sign(vy);
    }

		vy = 0;
	}
}

y += vy * global.delta;
*/








if (vy < 1 && vy > -1)
    PlatformCheck();
else
    repeat(abs(vy)) {
        if (!PlatformCheck())
            y += sign(vy) * global.delta;
        else
            break;
    }




/*
if (platformTarget) {
    if (!onGround)
        landed = true;
    
    if (landed)
        with (platformTarget) other.vy = 0;
    else
        with (platformTarget) other.vy = 0;
}
*/

repeat(abs(vx)) {
		// slope logic???
    //if (place_meeting(x + sign(vx), y, oParSolid) && !place_meeting(x + sign(vx), y - 1, oParSolid))
        //y -= 1;
         
    //if (place_meeting(x + sign(vx), y + 2, oParSolid) && !place_meeting(x + sign(vx), y + 1, oParSolid))
        //y += 1;
        
    if (!place_meeting(x + sign(vx), y, oParSolid))
        x += sign(vx) * global.delta;
    else
        vx = 0;
}