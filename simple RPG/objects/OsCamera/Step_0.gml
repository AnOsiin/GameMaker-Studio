//Update camera


//update dest
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

//update obj position
x += (xTo - x) / 15	;
y += (yTo - y) / 15 ;

//Keep camera inside room
x = clamp(x, view_WidthHalf, room_width - view_WidthHalf);
y = clamp(y, view_HeightHalf, room_height - view_HeightHalf);

//Screen shake
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));
camera_set_view_pos(cam, x - view_WidthHalf, y - view_HeightHalf);



