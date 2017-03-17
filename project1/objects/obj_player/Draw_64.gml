/// @description Insert description here

draw_set_font(fnt_debug);
draw_text_colour(32, 32, "x: " + string(x), c_white, c_white, c_white, c_white, 1.0);
draw_text_colour(32, 64, "y: " + string(y), c_white, c_white, c_white, c_white, 1.0);
draw_text_colour(32, 96, "hspd: " + string(hspd), c_white, c_white, c_white, c_white, 1.0);
draw_text_colour(32, 128, "vspd: " + string(vspd), c_white, c_white, c_white, c_white, 1.0);

draw_text_colour(320, 32, "platform: " + string(platform), c_white, c_white, c_white, c_white, 1.0);
draw_text_colour(320, 64, "should land: " + string(should_land), c_white, c_white, c_white, c_white, 1.0);
draw_text_colour(320, 96, "status: " + string(status), c_white, c_white, c_white, c_white, 1.0);
draw_text_colour(320, 124, "ply: " + string(ply_status), c_white, c_white, c_white, c_white, 1.0);
