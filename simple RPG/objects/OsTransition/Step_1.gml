/// @description Insert description here
// You can write your code in this editor
with (OsPlayer) {
	 if (state != PlayerStateDead) state = PlayerRoomTransition;
}
if(leading == OUT)
{
	percent = min(1, percent + TRANSITION_SPEED);
	if(percent >= 1)    //screen fully obscured
	{
		room_goto(target);
		leading = IN; 
	}
} else //leading == IN
{
	percent = max(0, percent - TRANSITION_SPEED);
	if(percent <= 0)    //screen fully reveal
	{
		with (OsPlayer) state = PlayerStateFree;
		instance_destroy();
	}
}










