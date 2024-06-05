/// @description Insert description here
// You can write your code in this editor
if (instance_exists(OsPlayer)) && (position_meeting(OsPlayer.x, OsPlayer.y, id))
{
	
	if(!instance_exists(OsTransition)) && (OsPlayer.state != PlayerStateDead){
	global.targetRooom = targetRoom;
	global.targetX = targetX;
	global.targetY = targetY;
	global.targetDirecttion = OsPlayer.direction;
	
	//room_goto(targetRoom);
	with(OsPlayer) state = PlayerRoomTransition;
	RoomTransition(TRANS_TYPE.SLIDE, targetRoom);
	
	
	instance_destroy();
	}
}









