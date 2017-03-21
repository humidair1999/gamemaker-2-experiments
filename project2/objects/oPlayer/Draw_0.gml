// Draw sprite depending on player state

var isDebugging = true;

if (!attacking) {
    switch (state) {
        case IDLE:
            image_speed = 1;
            
						/*
            if (blocking)
                sprite_index = sPlayerIdleShield;
            else
						*/
                sprite_index = sPlayerIdle;
        break;
        
        case RUN: 
            image_speed = 1; 
            
						/*
            if (blocking)
                sprite_index = sPlayerRunShield;
            else
						*/
                sprite_index = sPlayerRun;
        break;
        
        case JUMP:
						/*
            // Mid jump   
            if (!(place_meeting(x, y + 2, oParSolid) && vy != 0) && vy >= -1.0 && vy <= 1.0) {  
                if (blocking)
                    sprite_index = sPlayerJumpMShield;
                else
                    sprite_index = sPlayerJumpM;  
           } else {
					 */
                // Rise + fall
                if (vy <= 0) {
										/*
                    if (blocking)
                        sprite_index = sPlayerJumpUShield;
                    else
										*/
                        sprite_index = sPlayerRun;
												
												image_speed = 0;
												image_index = 3;
                } else {
										/*
                    if (blocking)
                        sprite_index = sPlayerJumpDShield;
                    else
										*/
                        sprite_index = sPlayerRun;
												image_speed = 0;
												image_index = 6;
                }
						/*
            }
						*/
             
            // When against a wall   
						/*
            if (cRight || cLeft)
                if (blocking)
                    sprite_index = sPlayerSlideShield;
                else
                    sprite_index = sPlayerSlide;  
						*/
        break;
        
				/*
        case ROLL:
            // Don't do stuff here    
        break;
				*/
    }
}

// Draw player
if (onGround)
    draw_sprite_ext(sprite_index, image_index, x, y, facing, 1, 0, c_white, image_alpha);    
else
    draw_sprite_ext(sprite_index, image_index, x, y, facing, 1, 0, c_white, image_alpha);

if (isDebugging) {
  draw_text(200, 16, string(vy));
  
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
  
  draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom + vy, true);

	with (oBlock) {
	  draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	}

	with (oJumpThru) {
	  draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	}
	
	with (oPlayerAtkBox) {
		draw_set_color(c_red);
		draw_rectangle(bboxleft, bboxtop, bboxright, bboxbottom, true);
		draw_set_color(c_white);
	}
}
