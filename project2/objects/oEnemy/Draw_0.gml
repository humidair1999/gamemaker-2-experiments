if (!attacking) {
  switch (state) {
    case IDLE:
      image_speed = 1;
      sprite_index = sPlayerIdle;
    
      break;
    case RUN:
      image_speed = 1; 
      sprite_index = sPlayerRun;
    
      break;
    case CHASE:
      image_speed = 1; 
      sprite_index = sPlayerRun;
    
      break;
  }
}

draw_sprite_ext(sprite_index, image_index, x, y, facing, 1, 0, image_blend, 1);

//draw_rectangle(bbox_left, bbox_top - 35, bbox_right, bbox_top - 31, true);

var pc = (hp / maxHp) * 100;
var bboxwidth = bbox_right - bbox_left;

draw_healthbar(bbox_left, bbox_top - 35, bbox_right, bbox_top - 31, pc, c_black, c_red, c_red, 0, false, false);

//draw_text(bbox_left + (bboxwidth / 2), bbox_top - 75, string(pc));