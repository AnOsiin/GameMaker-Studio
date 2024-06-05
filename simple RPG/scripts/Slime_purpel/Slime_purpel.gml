// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Slime_purpelAttack(){
	var _spd = eSpeed;
	if (image_index < 6) _spd = 0;
	
	if(floor(image_index) == 10) || (floor(image_index) == 13) image_speed = 0; 
	
	var _distanceTOGO = point_distance(x, y, xTo, yTo); //how far slime hav to jump
	
	if (_distanceTOGO < 4) && (image_index <13) image_speed = 1; //begin landing and end animation once nearly done
	
	//Move
	if (_distanceTOGO > _spd) {
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_spd, dir);
		vSpeed = lengthdir_y(_spd, dir);
		
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		//Commit to move and stop if hit a wall
		if(EnemyTileCollision() == true){
			xTo = x;
			yTo = y;
		}
	} else {
		x = xTo;
		y = yTo;
		
		if(floor(image_index) == 13){
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDura = 15;
			state = ENEMYSTATE.WAIT;
		}
	}
}