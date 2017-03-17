/// @description Insert description here

draw_set_font(fnt_debug);
draw_text_colour(20, 32, "x: " + string(x), c_white, c_white, c_white, c_white, 1.0);
draw_text_colour(20, 64, "y: " + string(y), c_white, c_white, c_white, c_white, 1.0);
draw_text_colour(20, 96, "hspd: " + string(hspd), c_white, c_white, c_white, c_white, 1.0);
draw_text_colour(20, 128, "vspd: " + string(vspd), c_white, c_white, c_white, c_white, 1.0);

draw_text_colour(220, 32, "platform: " + string(platform), c_white, c_white, c_white, c_white, 1.0);
draw_text_colour(220, 64, "should land: " + string(should_land), c_white, c_white, c_white, c_white, 1.0);
draw_text_colour(220, 96, "status: " + string(status), c_white, c_white, c_white, c_white, 1.0);
draw_text_colour(220, 124, "ply: " + string(ply_status), c_white, c_white, c_white, c_white, 1.0);

draw_text_colour(420, 32, "below: " + string(platform_below), c_white, c_white, c_white, c_white, 1.0);
draw_text_colour(420, 64, "in loop: " + string(in_loop), c_white, c_white, c_white, c_white, 1.0);
draw_text_colour(420, 96, "play: " + string(play_bbox), c_white, c_white, c_white, c_white, 1.0);
draw_text_colour(420, 128, "plat: " + string(plat_bbox), c_white, c_white, c_white, c_white, 1.0);

draw_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + vspd, true);

if (platform != noone) {
	draw_rectangle(platform.bbox_left, platform.bbox_bottom, platform.bbox_right, platform.bbox_bottom, true);
}
