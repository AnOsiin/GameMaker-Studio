/// @description Insert description here
// You can write your code in this editor
if (!global.gamePause){
	bombTick--;
	if(bombTick == 0){
		flash = 0.75;
		bombStage++;
		bombTick = bombTickRate[bombStage];
	}
	
	if(bombTick < 0){
		y -= z;
		if(lifted){
			Player_DropItem();
		}
		instance_destroy();
	}
}









