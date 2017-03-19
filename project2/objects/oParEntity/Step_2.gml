// Handle sub-pixel movement
cx += vx;
cy += vy;
vxNew = round(cx);
vyNew = round(cy);
cx -= vxNew;
cy -= vyNew;

EntityStep();

var bbox_width = (bbox_right + 1) - bbox_left;
//var bbox_height = (bbox_bottom + 1) - bbox_top;

x = clamp(x, bbox_width, room_width - bbox_width);

// Pit death
if (bbox_top > room_height)
    instance_destroy();
