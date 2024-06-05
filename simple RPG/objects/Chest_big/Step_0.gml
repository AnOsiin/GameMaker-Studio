/// @description Insert description here
// You can write your code in this editor




// Inherit the parent event
event_inherited();

if(place_meeting(x, y, OsPlayer)) && (chestTriggerd = false)
{
	if(keyboard_check_pressed(vk_space)) {
		chestTriggerd = true;
		if(eDrop != -1) && (eDropList != -1) && (chestOpened = false){
			DropItems(x, y, eDropCount, eDrop);
			DropItems_Random(x, y, eDropList);
			chestOpened = true;
		}
	
		
		image_speed = 1.0;
	}
	
}
if(image_index = 3) image_speed = 0

