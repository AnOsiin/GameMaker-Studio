// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RoomTransition(){
	if(!instance_exists(OsTransition))
	{
		with (instance_create_depth(0, 0, -9999, OsTransition)){
			type = argument[0];
			target = argument[1];
		}
		
	} else show_debug_message("attempt to transition");
}