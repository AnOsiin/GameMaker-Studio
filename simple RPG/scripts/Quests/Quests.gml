// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ActivateHatNPC(){
	var _hasHat = (global.iLifted != noone) && (global.iLifted.object_index == oHat);
	switch (global.questStatus[? "TheHatQuest"])
	{
		case 0: //not started
		{
			//player might have brought the hat back anyway
			if (_hasHat)
			{
				//complete quest
			
			}
			else
			{
				//offer quest
				NewTextBox("Hello there adventurer! You look like a brave one! \nWhat with cape and all", 2);
				NewTextBox("Could you help me find my missing Magic hat ?", 2, ["4: Of course!", "5: This task is beneath me"]);
				
				
			}
			
		}break;
		
		case 1: //quest in progress
		{
			if (_hasHat)
			{
				//complete quest
			}
			else
			{
				//clue reminder
				NewTextBox("Did you find my hat ?", 2);
				NewTextBox("You mind need some items to hekp you in the cave.", 2);
				NewTextBox("My friend have a shop in the north-east, you can buy something helpful there.", 2);
				
			}
			
		}break;
		case 2: //quest already completed
		{
			
		} break;
	}
}