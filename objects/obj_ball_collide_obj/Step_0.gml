/// @description Insert description here
// You can write your code in this editor
if (is_frozen)
{
	room_speed = 30;
	is_frozen = false;
}

if (edge_of_level()) // check for edge of world collision
{
	
	// How much velocity gransfers from linear to angular based on angle
	// using dot product of normalized velocity vector
	norm_hspeed = hspeed/speed;
	norm_vspeed = vspeed/speed;
	
	// scale from 0 to 1 to 0 to .2
	norm_hspeed = (norm_hspeed * .2);
	norm_vspeed = (norm_vspeed * .2);	
	
	// Deflect ball at angle based on angular momentum
	direction += radtodeg(am * .5);
	am *= .5;
	
	// Collides with top of level
	if (y + vspeed <  border + radius) 
	{
		// Get ratio versus vspeed portion of vector versus distance from y at top of level
		show_debug_message("Hits top end of level");
		
		position_vertical(y - (border + radius));
		
		// Translate portion of hspeed to angular momentum (am = hspeed/radius)
		am += (norm_hspeed) * abs(hspeed) /radius;
	}
	
	//Collides with bottom of level
	else if (y + vspeed  > room_height - border - radius ) 
	{
		show_debug_message("Hits bottom end of level");
		
		position_vertical(((room_height - border - radius) - y));

		// Translate portion of hspeed to angular momentum (am = hspeed/radius)
		am += (norm_hspeed) * abs(hspeed) /radius;

	}
	
	// Collides with left side of level
	if (x + hspeed  <  border + radius) 
	{
		show_debug_message("Hits left end of level");
		
		position_horizontal(x - (border + radius));
		
		// Translate portion of hspeed to angular momentum (am = hspeed/radius)
		am += (norm_vspeed) * abs(vspeed) /radius;
	}
	
	// Collides with right side of level
	else if (x + hspeed  > room_width - border - radius)
	{
		show_debug_message("Hits right end of level");
		
		position_horizontal((room_width - border - radius) - x);

		// Translate portion of hspeed to angular momentum (am = hspeed/radius)
		am += (norm_vspeed) * abs(vspeed) /radius;
	}
	

	// go back one frame as hspeed and vspeed are not set yet
	x -= hspeed;
	y -= vspeed;
	// Remove angular velocity from total speed
	speed = max_speed - (abs(am * radius));
	
	if (freeze_on_bounce) room_speed = 1;
	is_frozen = true;

}

// Check to see if colliding with platform called obj_ground
col = instance_place(x + hspeed, y + vspeed, obj_ground);
if (col != noone)
{
	new_dir = point_direction(x, y, col.center_x, col.center_y);
	
	show_debug_message("new_dir: " + string(new_dir));
		
	// Top of object
	if (new_dir >= 225 && new_dir < 315)
	{
		// check if ball is within the middle of the object or still over solid groud - NOT HITTING A CORNER
		if ((x >= col.bbox_left || collision_point(col.bbox_left -1, col.bbox_top, obj_ground, true, true)) && (x <= col.bbox_right || collision_point(col.bbox_right + 1, col.bbox_top, obj_ground, true, true)) ) 
		{
			
			position_vertical((col.bbox_top - radius)  - y);
		}
		else if (x < col.bbox_left) // bouncing off left edge
		{
			show_debug_message("Bouncing off top left corner of object");
			
			var bounce = closest_intersection_from_corner(col.bbox_left, col.bbox_top);
			if (!bounce)
			{
				show_debug_message("Missed top left corner");
				position_vertical((col.bbox_top - radius)  - y);	
			}

		}
		
		else if (x > col.bbox_right)
		{
			show_debug_message("Bouncing off top right corner of object");
			
			var bounce = closest_intersection_from_corner(col.bbox_right, col.bbox_top);
			
			if (!bounce)
			{
				show_debug_message("Missed top right corner");
				position_vertical((col.bbox_top - radius)  - y);	
			}
		}
	
		am += (norm_hspeed) * abs(hspeed) /radius;
	}
	
	// Bottom of object
	else if (new_dir >= 45 && new_dir < 135)
	{
		// check if ball is within the middle of the object or still under solid groud - NOT HITTING A CORNER
		if ((x >= col.bbox_left || collision_point(col.bbox_left -1, col.bbox_top, obj_ground, true, true)) && (x <= col.bbox_right || collision_point(col.bbox_right + 1, col.bbox_top, obj_ground, true, true)) ) 
		{	
			show_debug_message("Bouncing off top of object");
			
			position_vertical(y - (col.bbox_bottom + radius));
		}
		
		else if (x < col.bbox_left)
		{
			show_debug_message("Bouncing off bottom left corner of object");
			
			var bounce = closest_intersection_from_corner(col.bbox_left, col.bbox_bottom);
			if (!bounce)
			{
			show_debug_message("Missed bounce off bottom left corner of object");
			
			position_vertical(y - (col.bbox_bottom + radius));
			}
		}
		
		else if (x > col.bbox_right)
		{
			show_debug_message("Bouncing off bottom right corner of object");
			
			var bounce = closest_intersection_from_corner(col.bbox_right, col.bbox_bottom);
			
			if (!bounce)
			{
			show_debug_message("Missed bounce off bottom right corner of object");
			
			position_vertical(y - (col.bbox_bottom + radius));
			}
		}
		
		am += (norm_hspeed) * abs(hspeed) /radius;
	}
	
	// Left of object
	else if (new_dir >= 315 || new_dir < 45)
	{
		
		// check if ball is within the cemter of the object or still to the left of solid groud - NOT HITTING A CORNER
		if ((y >= col.bbox_top || collision_point(col.bbox_right, col.bbox_top -1, obj_ground, true, true)) && (y <= col.bbox_bottom || collision_point(col.bbox_right, col.bbox_bottom + 1, obj_ground, true, true)))
		{
			show_debug_message("Bouncing off left side of object");
			
			position_horizontal((col.bbox_left - radius) - x);
		}
		
		else if (y < col.bbox_top)
		{
			show_debug_message("Bouncing off left top corner of object");
			
			var bounce = closest_intersection_from_corner(col.bbox_left, col.bbox_top);	
			if (!bounce)
			{
				show_debug_message("Missed bounce off left top corner of object");
			
				position_horizontal((col.bbox_left - radius) - x);
			}
		}
		
		else if (y > col.bbox_bottom)
		{
			show_debug_message("Bouncing off left bottom corner of object");
			
			var bounce = closest_intersection_from_corner(col.bbox_left, col.bbox_bottom);	
			if (!bounce)
			{
				show_debug_message("Missed bounce off left bottom corner of object");
			
				position_horizontal((col.bbox_left - radius) - x);
			}
		}

		// Translate portion of hspeed to angular momentum (am = hspeed/radius)
		am += (norm_vspeed) * abs(vspeed) /radius;
	}
	
	// Right of object
	else if (new_dir >= 135 && new_dir < 225)
	{
		// check if ball is within the cemter of the object or still to the right of solid groud - NOT HITTING A CORNER
		if ((y >= col.bbox_top || collision_point(col.bbox_right, col.bbox_top -1, obj_ground, true, true)) && (y <= col.bbox_bottom || collision_point(col.bbox_right, col.bbox_bottom + 1, obj_ground, true, true)) )
		{
			show_debug_message("Bouncing off right side of object");
						
			position_horizontal(x - (col.bbox_right + radius));
		}
		
		else if (y < col.bbox_top)
		{
			show_debug_message("Bouncing off right top corner of object");
			
			var bounce = closest_intersection_from_corner(col.bbox_right, col.bbox_top);	
			if (!bounce)
			{
				show_debug_message("Missed bounce off right top corner of object");
				
				position_horizontal(x - (col.bbox_right + radius));
			}
		}
		
		else if (y > col.bbox_bottom)
		{
			show_debug_message("Bouncing off right bottom corner of object");
			
			var bounce = closest_intersection_from_corner(col.bbox_right, col.bbox_bottom);	
			if (!bounce)
			{
				show_debug_message("Missed bounce off right bottom corner of object");
				
				position_horizontal(x - (col.bbox_right + radius));
			}
		}
		
		// Translate portion of hspeed to angular momentum (am = hspeed/radius)
		am += (norm_vspeed) * abs(vspeed) /radius;
	}
	
	else
	{
		show_debug_message("Object collision not working correctly");	
	}

	x -= hspeed;
	y -= vspeed;

	if (freeze_on_bounce) room_speed = 1;
	is_frozen = true;
	
}


// Animate angular momentum
image_angle -= radtodeg(am);



if (keyboard_check_pressed(ord("F")))
{
	freeze_on_bounce = !freeze_on_bounce;
}

