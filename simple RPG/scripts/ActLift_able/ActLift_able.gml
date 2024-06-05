// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ActLift_able(){
	if(global.iLift == noone){
		PlayerActAnimation(Player_hold_idle_all);
		
		sIdle = Player_hold_idle_all;
		sWalking = Player_hold_walk_all;
		
		global.iLift = argument0;
		with(global.iLift){
			lifted = true;
			persistent = true;
		}
	}
}