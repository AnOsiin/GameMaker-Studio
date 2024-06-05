function Player_animation(){
var _totalFrame = sprite_get_number(sprite_index) / 4;

image_index = localFrame + (CARDINAL_DIR * _totalFrame);
localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;

//IF animation would loop on next game step
if (localFrame >= _totalFrame)
{
	animationEnd = true;
	localFrame -= _totalFrame;
} else animationEnd = false; 
}


function PlayerActAnimation(sprite, endScript = -1){
	//Carry out an animation and optionally carry out a script when the animation ends
	state = PlayerStateAct;
	
	sprite_index = sprite;
	animationEndScripts = endScript;
	
	localFrame = 0;
	image_index = 0;
	Player_animation();
}

function PlayerThrow(){
	with(global.iLift)
	{
		lifted = false;
		persistent = false;
		thrown = true;
		z = 13;
		throwpHeight = z +10;
		throwDistance = eThrowDistance;
		throwDistanceTravelld = 0;
		throwStartPercent = (13/throwpHeight) * 0.5;
		throwPercent = throwStartPercent;
		direction = other.direction;
		xstart = x;
		ystart = y;
		
	}
	PlayerActAnimation(Player_hold_idle_all)
	global.iLift = noone;
	
	sIdle = Player_idle_all;
	sWalking = Player_walk_all;
}