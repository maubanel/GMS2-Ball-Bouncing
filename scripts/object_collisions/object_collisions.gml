
/*******************************************************************
*
*			NOT A FUNCTION
*		AABB COLLISION WITH OBJECT
*
*
********************************************************************/

//Check to see if colliding with platform called obj_collision_parent
var nearest = instance_nearest(x-32, y-32, obj_collision_parent);

col = instance_place(x, y, nearest);
if (col != noone)
{
	collision = false;
	// Reset corner to false
	//top_left_corner = false;
	//top_right_corner = false;
	//bottom_left_corner = false;
	//bottom_right_corner = false;
	
//		// How much velocity gransfers from linear to angular based on angle
//	// using dot product of normalized velocity vector
	var norm_hspeed = hspeed/speed;
	var norm_vspeed = vspeed/speed;
	
//	// scale from 0 to 1 to 0 to .2
	var norm_hspeed = (norm_hspeed * .2);
	var norm_vspeed = (norm_vspeed * .2);	
	
	
	// Angle from center of object
	// Subtracting hspeed and vspeed to get better angle for edge collisions
	new_dir = point_direction(col.center_x, col.center_y, x - hspeed, y - vspeed);
	
	show_debug_message("new_dir: " + string(new_dir));

	// Top of object
	if (angle_within_range(new_dir, col.top_right_angle, col.top_left_angle) )
	{
		//show_debug_message("colliding with top | new_dir: " + string(new_dir) + " | l_angle: " + string(col.top_right_angle) + " | r_angle: " + string(col.top_left_angle));
		// Inside rectangle collision volume
		// Check if circle collides with line of plane (non rectangular shapes allowed)
		
		if (circle_line_collision(col.top_left_x, col.top_left_y, col.top_right_x, col.top_right_y, radius, side.top))
		{
			add_noise();
				
			//show_debug_message("Line circle collision - frame " + string(current_time));
			
			if (top_right_corner)
			{
				position_corner(col.top_right_x, col.top_right_y);
				
				reflect_vector_perpendicular(hspeed, vspeed, col.top_right_x - x , col.top_right_y - y );
				
				show_debug_message("Bouncing off top right corner of object");
				
				am += norm_hspeed * abs(hspeed) /radius;
			}
			
			else if (top_left_corner)
			{
				position_corner(col.top_left_x, col.top_left_y);
				
				reflect_vector_perpendicular(hspeed, vspeed, col.top_left_x - x , col.top_left_y - y );
				
				show_debug_message("Bouncing off top left corner of object");
				
				am += norm_hspeed * abs(hspeed) /radius;
			}
			
			else // plane colliding with orthogonal
			{
				position_object(side.top);
				
				if (col.top_slope == 0 ) show_debug_message("Bouncing off top of orthoganal object");
				
				else show_debug_message("Bouncing off top of non-orthoganal object");
				
				am += norm_hspeed * abs(hspeed) /radius;
			
			}
		}
		else show_debug_message("no circle line collision on top");
	}
		
	
	// Bottom of object
	else if (angle_within_range(new_dir, col.bottom_left_angle , col.bottom_right_angle))
	{
		//show_debug_message("colliding with bottom");
		// Check if circle collides with line of plane (non rectangular shapes allowed)
		if (circle_line_collision(col.bottom_left_x, col.bottom_left_y, col.bottom_right_x, col.bottom_right_y, radius, side.bottom))
		{
			if (bottom_right_corner)
			{
				position_corner(col.bottom_right_x, col.bottom_right_y);
				
				reflect_vector_perpendicular(hspeed, vspeed, col.bottom_right_x - x, col.bottom_right_y - y );
				
				show_debug_message("Bouncing off bottom right corner of object");
				
				am += -norm_hspeed * abs(hspeed) /radius;
			}
			
			else if (bottom_left_corner)
			{
				position_corner(col.bottom_left_x, col.bottom_left_y);
				
				reflect_vector_perpendicular(hspeed, vspeed, col.bottom_left_x - x , col.bottom_left_y - y );
				
				show_debug_message("Bouncing off bottom left corner of object");
				
				am += -norm_hspeed * abs(hspeed) /radius;
			}
			
			else 
			{
			
				position_object(side.bottom);
				
				if (col.bottom_slope == 0 )	show_debug_message("Bouncing off bottom of orthogonal object");
				else show_debug_message("Bouncing off bottom of non-orthoganal object");
				
				am += -norm_hspeed * abs(hspeed) /radius;
			
			}
		}
		else show_debug_message("no circle line collision on bottom");

	}
	
	// Left of object
	else if (angle_within_range(new_dir, col.top_left_angle, col.bottom_left_angle))
	{
		//show_debug_message("colliding with left");
		// Check if circle collides with line of plane (non rectangular shapes allowed)
		if (circle_line_collision(col.top_left_x, col.top_left_y, col.bottom_left_x, col.bottom_left_y, radius, side.left))
		{
			
			if (bottom_left_corner)
			{			
				position_corner(col.bottom_left_x, col.bottom_left_y);
				
				reflect_vector_perpendicular(hspeed, vspeed, col.bottom_left_x - x , col.bottom_left_y - y );
				
				show_debug_message("Bouncing off left bottom corner of object");
				
				am += -norm_vspeed * abs(vspeed) /radius;
			}
			
			else if (top_left_corner)
			{
				position_corner(col.top_left_x, col.top_left_y);
				
				reflect_vector_perpendicular(hspeed, vspeed, col.top_left_x - x, col.top_left_y - y );
				
				show_debug_message("Bouncing off left top corner of object");
				
				am += -norm_vspeed * abs(vspeed) /radius;
			}
				
			
			else 
			{
			
				position_object(side.left);
				
				am += -norm_vspeed * abs(vspeed) /radius;
				
				if (col.left_slope == 0 ) show_debug_message("Bouncing off left side of orthogonal object");
				
				else show_debug_message("Bouncing off left side of non-orthogonal object");
			}
		}
	}
	
	// Right of object
	else if (angle_within_range(new_dir, col.bottom_right_angle, col.top_right_angle))
	{
		
		// Check if circle collides with line of plane (non rectangular shapes allowed)
		if (circle_line_collision(col.top_right_x, col.top_right_y, col.bottom_right_x, col.bottom_right_y, radius, side.right))
		{
			if (bottom_right_corner)
			{
				position_corner(col.bottom_right_x, col.bottom_right_y);
				
				reflect_vector_perpendicular(hspeed, vspeed, col.bottom_right_x -x , col.bottom_right_y - y );
				
				show_debug_message("Bouncing off right bottom corner of object");
				
				am += norm_vspeed * abs(vspeed) /radius;
			}
			
			else if (top_right_corner)
			{
				position_corner(col.top_right_x, col.top_right_y);

				reflect_vector_perpendicular(hspeed, vspeed, col.top_right_x -x , col.top_right_y - y );
				
				show_debug_message("Bouncing off right top corner of object");
				
				am += norm_vspeed * abs(vspeed) /radius;
			}
				
			
			else 
			{

			
				position_object(side.right);

				am += norm_vspeed * abs(vspeed) /radius;
				
				if (col.right_slope == 0 ) show_debug_message("Bouncing off right side of orthogonal edge");
				
				else show_debug_message("Add right side non orthogonal edge");	
			}
		}
	}
	
	else
	{
		show_debug_message("Object collision not working correctly");	
	}
	
	show_debug_message("Preb dir: " + string(original_angle) + " - hspeed: " + string(hspeed));
	show_debug_message("Postb dir: " + string(reflection_angle));
	
	if (collision)
	{
		// Deflect ball at angle based on angular momentum
		direction -= radtodeg(am * .1);
		am *= .9;
		show_debug_message("Post Collision Angle: " + string(direction));
	}
	
} // end of collision with shape/line
	
//show_debug_message("direction: " + string(direction));


	
// Remove angular velocity from total speed
speed = max_speed - (abs(am * radius));

	
if (freeze_on_bounce) room_speed = 1;
is_frozen = true;