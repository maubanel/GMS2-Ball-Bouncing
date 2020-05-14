/// @description Insert description here
// You can write your code in this editor
if (is_frozen)
{
	//room_speed = 30;
	is_frozen = false;
}

// Mouse Testing
// x = mouse_x;
// y = mouse_y;

// Check object collision first in cawe ball is colliding with object AND over edge
object_collisions();

world_boundary_collisions();

//object_collisions();


// Animate angular momentum
image_angle -= radtodeg(am);



if (keyboard_check_pressed(ord("F")))
{
	//freeze_on_bounce = !freeze_on_bounce;
	if (room_speed == 30) room_speed = 5; else room_speed = 30;
}

// Mouse Testing
// x = mouse_x;
// y = mouse_y;

