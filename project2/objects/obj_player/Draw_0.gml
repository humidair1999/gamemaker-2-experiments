// Draw sprite depending on player state

    switch (sprite_state) {
        case "idling":
            image_speed = 1;
            
						/*
            if (blocking)
                sprite_index = sPlayerIdleShield;
            else
						*/
                sprite_index = spr_player_idle;
        break;
        
        case "walking": 
            image_speed = 1; 
            
						/*
            if (blocking)
                sprite_index = sPlayerRunShield;
            else
						*/
                sprite_index = spr_player_run;
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
                        sprite_index = spr_player_run;
												
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
          sprite_index = spr_player_run;
					image_speed = 0;
					image_index = 6;
        break;
        
        case "dodgingBegin":
          image_index = 3;
          image_speed  = 0;
          sprite_index = spr_player_jab;
        break;
        
        case "dodgingEnd":
          image_index = 4;
          image_speed  = 0;
          sprite_index = spr_player_jab;
        break;
        
        case "attacking":
          /*
          if (state_new) {
            image_index = 0;
          }
          */
          image_speed  = 1;
          sprite_index = spr_player_jab;
        break;
        
				/*
        case ROLL:
            // Don't do stuff here    
        break;
				*/
    }


// Draw player

draw_sprite_ext(sprite_index, image_index, x, y, facing, 1, 0, image_blend, image_alpha);
