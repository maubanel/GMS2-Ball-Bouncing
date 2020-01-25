/// @description Insert description here
// You can write your code in this editor
if (y  <  border + radius)
{
		vspeed = -vspeed;
		//y = border + radius - vspeed;
}
	
else if (y  > room_height - border - radius)
{
		vspeed = -vspeed;
	//	y = room_height - border - radius - vspeed;
}

if (x  <  border + radius)
{
	hspeed = -hspeed;	
//	x = border + radius -hspeed;
	
}

else if (x  > room_width - border - radius)
{
	hspeed = -hspeed;	
//	x = room_width - border - radius -hspeed;
}

if (keyboard_check_pressed(ord("S")))
{
	room_speed = (room_speed == 5) ? 30 : 5;
}