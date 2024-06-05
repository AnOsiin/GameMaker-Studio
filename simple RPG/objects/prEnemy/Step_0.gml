/// @description Insert description here
// You can write your code in this editor

if (!global.gamePause)
{
	if(enemyScript[state] != -1) script_execute(enemyScript[state]);
	depth = -bbox_bottom;
}

if (blendtime>0){
	blendtime-=1;
}else{
	blend=image_blend;
}








