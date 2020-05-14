/// @description Brings angle within -180 and 180 range

angle_normalized = argument0;

if ( angle_normalized < 0 ) angle_normalized += 360;

return angle_normalized;