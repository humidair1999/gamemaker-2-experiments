var isDebugging = true;

if (isDebugging) {
  with (obj_player) {
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
  }

  with (obj_enemy) {
	  draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
    
    draw_set_color(c_aqua);
    draw_line(x - 200, y, x + 200, y);
    draw_set_color(c_white);
	}

	with (obj_block) {
	  draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	}

	with (obj_jump_thru) {
	  draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	}
	
	with (obj_player_atk_box) {
		draw_set_color(c_yellow);
		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
		draw_set_color(c_white);
	}
  
  with (obj_enemy_atk_box) {
		draw_set_color(c_yellow);
		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
		draw_set_color(c_white);
	}
}
