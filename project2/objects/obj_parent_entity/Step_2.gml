EntityStep();

var bbox_width = (bbox_right + 1) - bbox_left;
var bbox_height = (bbox_bottom + 1) - bbox_top;

x = clamp(x, bbox_width, room_width - bbox_width);
y = clamp(y, 0, room_height + (bbox_height * 2));

// Pit death
if (bbox_top > room_height)
    instance_destroy();
