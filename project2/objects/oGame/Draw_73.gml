var isDebugging = true;

if (isDebugging) {
  with (oPlayer) {
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
  }

  with (oEnemy) {
	  draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
    
    draw_set_color(c_aqua);
    draw_line(x - 200, y, x + 200, y);
    draw_set_color(c_white);
	}

	with (oBlock) {
	  draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	}

	with (oJumpThru) {
	  draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	}
	
	with (oPlayerAtkBox) {
		draw_set_color(c_yellow);
		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
		draw_set_color(c_white);
	}
  
  with (oEnemyAtkBox) {
		draw_set_color(c_yellow);
		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
		draw_set_color(c_white);
	}
}
