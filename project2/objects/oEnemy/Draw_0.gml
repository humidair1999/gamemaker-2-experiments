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
        
        case "falling":
          sprite_index = spr_player_run;
					image_speed = 0;
					image_index = 6;
        break;
        
        case "preLunge":
          image_index = 6;
          image_speed  = 0;
          sprite_index = spr_player_jab;
        break;
        
        case "lunge":
          image_index = 3;
          image_speed  = 0;
          sprite_index = spr_player_jab;
        break;
        
        case "lungeAttack":
          image_index = 5;
          image_speed  = 0;
          sprite_index = spr_player_jab;
        break;
}

draw_sprite_ext(sprite_index, image_index, x, y, facing, 1, 0, image_blend, 1);

//draw_rectangle(bbox_left, bbox_top - 35, bbox_right, bbox_top - 31, true);

var pc = (hp / maxHp) * 100;
var bboxwidth = bbox_right - bbox_left;

draw_healthbar(bbox_left, bbox_top - 35, bbox_right, bbox_top - 31, pc, c_black, c_red, c_red, 0, false, false);

//draw_text(bbox_left + (bboxwidth / 2), bbox_top - 75, string(pc));