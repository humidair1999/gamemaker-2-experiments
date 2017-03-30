// Draw sprite depending on player state

var isDebugging = true;


    switch (sprite_state) {
        case "idling":
            image_speed = 1;
            
						/*
            if (blocking)
                sprite_index = sPlayerIdleShield;
            else
						*/
                sprite_index = sPlayerIdle;
        break;
        
        case "walking": 
            image_speed = 1; 
            
						/*
            if (blocking)
                sprite_index = sPlayerRunShield;
            else
						*/
                sprite_index = sPlayerRun;
        break;
        
        case "jumping":
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
              
										/*
                    if (blocking)
                        sprite_index = sPlayerJumpUShield;
                    else
										*/
                        sprite_index = sPlayerRun;
												
												image_speed = 0;
												image_index = 3;
              
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
        
        case "falling":
          sprite_index = sPlayerRun;
					image_speed = 0;
					image_index = 6;
        break;
        
        case "attacking":
          /*
          if (state_new) {
            image_index = 0;
          }
          */
          image_speed  = 1;
          sprite_index = sPlayerJab;
        break;
        
				/*
        case ROLL:
            // Don't do stuff here    
        break;
				*/
    }


// Draw player
/*
if (onGround)
    draw_sprite_ext(sprite_index, image_index, x, y, facing, 1, 0, c_white, image_alpha);    
else
*/

draw_sprite_ext(sprite_index, image_index, x, y, facing, 1, 0, image_blend, image_alpha);

if (isDebugging) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);

  with (oEnemy) {
	  draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	}

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
  
  with (oEnemyAtkBox) {
		draw_set_color(c_red);
		draw_rectangle(bboxleft, bboxtop, bboxright, bboxbottom, true);
		draw_set_color(c_white);
	}
}
