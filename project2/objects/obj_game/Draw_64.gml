//draw_sprite_ext(sprite_index, image_index, x, y, facing, 1, 0, image_blend, image_alpha);

with (oPlayer) {
  draw_healthbar(0, 0, 480, 20, hp, c_black, c_red, c_red, 0, false, false);
  draw_text(10, 0, string(hp));
  
  draw_healthbar(0, 20, 480, 40, stamina, c_black, c_blue, c_blue, 0, false, false);
  draw_text(10, 20, string(stamina));
}
