/// @description Insert description here
// You can write your code in this editor
var initial_direction = sign(hspeed);

if (hspeed != 0)
hspeed -= sign(hspeed) * ball_friction;

if (initial_direction < 0 && hspeed > 0) hspeed = 0;
else if (initial_direction > 0 && hspeed < 0) hspeed = 0;

// Angular momentum velocity = radius * angular_velocity
// v = rw
// w = v/r

am = -(hspeed / radius);

image_angle += (radtodeg(am));

if (hspeed == 0 && alarm < 0) alarm[0] = 30;
