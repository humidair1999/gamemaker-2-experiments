//draw_sprite_ext(sprite_index, image_index, x, y, facing, 1, 0, image_blend, image_alpha);

with (oPlayer) {
  var pc = (hp / maxHp) * 100;

  draw_healthbar(0, other.vh - 60, 480, other.vh, pc, c_black, c_red, c_red, 0, false, false);
}
