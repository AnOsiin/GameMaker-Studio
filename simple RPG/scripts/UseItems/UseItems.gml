// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UseItemBOMB(){
	if(global.playerAmmo[ITEMS.BOMB] > 0) && (global.iLift == noone){
		global.playerAmmo[ITEMS.BOMB]--;
		var _bomb = instance_create_layer(x, y, "Instances", OsBoom);
		ActLift_able(_bomb);
	}
}

function UseItemBOW(){
	if(global.playerAmmo[ITEMS.BOW] > 0) && (global.iLift == noone){
		global.playerAmmo[ITEMS.BOW]--;
		PlayerActAnimation(Player_Bow_temp, PlayerFireArrow());
	}
}

function PlayerFireArrow() {
	with(instance_create_depth(floor(x), floor(y)-7, depth, OsArrow)){
		direction = other.direction;
		direction = CARDINAL_DIR * 90;
		image_speed = 0;
		image_index = CARDINAL_DIR;
		speed = 6;
	}
	
}

function UseItemHOOK(){
	state = PlayerStateHooked;
	localFrame = 0;
}