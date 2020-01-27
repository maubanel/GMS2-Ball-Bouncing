/// @description Insert description here
// You can write your code in this editor

if (is_frozen)
{
	if (freeze_on_bounce) room_speed = 5;
	else room_speed = 30;
	is_frozen = false;
}

if (y  <  border + radius)
{
	vspeed = -vspeed;
	if (freeze_on_bounce) room_speed = 1;
	is_frozen = true;
}
	
else if (y  > room_height - border - radius)
{
	vspeed = -vspeed;
	if (freeze_on_bounce) room_speed = 1;
	is_frozen = true;
}

if (x  <  border + radius)
{
	hspeed = -hspeed;	
	if (freeze_on_bounce) room_speed = 1;
	is_frozen = true;
	
}

else if (x  > room_width - border - radius)
{
	hspeed = -hspeed;	
	if (freeze_on_bounce) room_speed = 1;
	is_frozen = true;
}

if (keyboard_check_pressed(ord("F")))
{
	freeze_on_bounce = !freeze_on_bounce;
	if (freeze_on_bounce) room_speed = 5;
	else room_speed = 30;
}

