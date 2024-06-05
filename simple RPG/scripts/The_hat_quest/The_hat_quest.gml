// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ActHatCat(){
var _hasHat = (global.iLift != noone) && (global.iLift.object_index == OsHat);
	switch (global.questStatus[? "Find my hat"])
	{
		case 0: //not started
		{
			//player might have brought the hat back anyway
			if (_hasHat)
			{
				//complete quest
				NewTextBox("Oh, is that my hat!!!",2);
				NewTextBox("Where do you find this, I lost it a long time ago",2)
				NewTextBox("You are a true Hero indeed!",2);
				global.questStatus[? "Find my hat"] = 2
				with (OsNPC_HatQuest) sprite_index = Questy_hat;
				with(OsHat) instance_destroy();
				global.iLift = noone;
				with(OsPlayer){
					sIdle = Player_idle_all;
					sWalking = Player_walk_all;
				} 
			}
			else
			{
				//offer the quest
				NewTextBox("Hello there Tralver! You look like a brave one!\nThe one with cape and all.",2);
				NewTextBox("Could you help me find my misshing hat?",2,
							["4:Of course!","5:This task is beneath me"]);
				
			}
			
		}break;
		
		case 1: //quest in progress
		{
			if (_hasHat)
			{
				//complete quest
				NewTextBox("Wow, you found my hat!",2)
				NewTextBox("You are a true Hero indeed!",2);
				global.questStatus[? "Find my hat"] = 2
				with (OsNPC_HatQuest) sprite_index = Questy_hat;
				with(OsHat) instance_destroy();
				global.iLift = noone;
				with(OsPlayer){
					sIdle = Player_idle_all;
					sWalking = Player_walk_all;
				} 
			}
			else
			{
				//clue reminder
				NewTextBox("Did you find my hat?",2);
				NewTextBox("I lost it in the cave that\n have ton of purple slime!",2);
				NewTextBox("If you have trouble trying to get there.\nYou might need to prepare yourself",2);
				NewTextBox("My friend who lives near the lake has a shop.\nHe might have something you want",2)
			}
			
		}break;
		case 2: //quest already completed
		{
			NewTextBox("Thanks again!",2)
		} break;
	}
}