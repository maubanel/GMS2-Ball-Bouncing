/// @description Check if test_angle is between angle1 and angle2
/// @param test_angle is angle to check
/// @param angle1 is first angle in range
/// @param angle2 is second angle in range

var test_angle = argument0;
var a1 = argument1;
var a2 = argument2;
//show_debug_message("test_angle: " + string(test_angle) + " | a1: " + string(a1) + " | a2: " + string(a2));
// subtract start angle from all angles
test_angle -= a1;
a2 -= a1;
a1 -= a1;

// Make all values positive
a1 = normalize_angle( a1 );
a2 =  normalize_angle( a2 );
test_angle = normalize_angle(test_angle)

//show_debug_message("test_angle: " + string(test_angle) + " | a2: " + string(a2));
return (test_angle < a2);