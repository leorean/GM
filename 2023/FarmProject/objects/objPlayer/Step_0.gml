/// @description step logic

// input -> movement
var left = kLeftPressing && !kRightPressing;
var right = !kLeftPressing && kRightPressing;
var up = kUpPressing && !kDownPressing;
var down = !kUpPressing && kDownPressing;

if (left && !right) xVel = -spd;
if (!left && right) xVel = spd;
if (!left && !right) xVel = 0;
if (up && !down) yVel = -spd;
if (!up && down) yVel = spd;
if (!up && !down) yVel = 0;

var colX = collision_rectangle(bbox_left + xVel, bbox_top, bbox_right + xVel, bbox_bottom, objSolid, false, true);
var colY = collision_rectangle(bbox_left, bbox_top + yVel, bbox_right, bbox_bottom + yVel, objSolid, false, true);

// restrict player within room bounds
if (bbox_left + xVel < 0) colX = true;
if (bbox_right + xVel > room_width) colX = true;
if (bbox_top + yVel < 0) colY = true;
if (bbox_bottom + yVel > room_height) colY = true;

// actual movement
if (!colX) {
	x += xVel;
} else {	
	x = ((x div T) * T) + sprite_xoffset; // snap X
	xVel = 0;
}

if (!colY) {
	y += yVel;
} else {
	y = ((y div T) * T) + sprite_yoffset; // snap Y
	yVel = 0;
}
