// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Slime_nonAttk_Wander(){
	sprite_index = sprMov;
	
	//already arrive or given up - location
	if((x == xTo) && (y == yTo)) || (timePassed > eWanderDistance / eSpeed){
		hSpeed = 0;
		vSpeed = 0;
		
		//End move animation
		if(image_index < 1){
			image_speed = 0.0;
			image_index = 0;
		}
		
		//set new target loction
		if(++wait >= waitDura){
			wait = 0;
			timePassed = 0;
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
			xTo = x + lengthdir_x(eWanderDistance, dir);
			yTo = y + lengthdir_y(eWanderDistance, dir);
			
		}
	} else{ //move toward new destination
		timePassed++;
		image_speed = 1.0; 
		var _distanceTOGO = point_distance(x, y, xTo, yTo);
		var _speedFrame_this = eSpeed;
		if(_distanceTOGO < eSpeed) _speedFrame_this = _distanceTOGO;
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_speedFrame_this, dir);
		vSpeed = lengthdir_y(_speedFrame_this, dir);
		
		
		if(hSpeed != 0) image_xscale = sign(hSpeed);
		
		//collide and move
		EnemyTileCollision_nonAttk();
	}
	
// Check for player to aggro
if (++aggroCheck >= aggroCheckDura) {
	aggroCheck = 0;
	if (instance_exists(OsPlayer)) && (point_distance(x, y, OsPlayer.x, OsPlayer.y) <= eAggroRadius)
	{
		state = ENEMYSTATE.CHASE;
		target = OsPlayer;
		
	}
}

}


function Slime_nonAttk_Chase(){
	sprite_index = sprMov;
	
	if(instance_exists(target)){
		xTo = target.x;
		yTo = target.y;
		var _distanceTOGO = point_direction(x, y, xTo , yTo)
		image_speed = 1.0;
		dir = point_direction(x, y, xTo, yTo)
		if (_distanceTOGO > eSpeed){
			hSpeed = lengthdir_x(eSpeed, dir);
			vSpeed = lengthdir_y(eSpeed, dir);
		} 
		else{
			hSpeed = lengthdir_x(_distanceTOGO, dir);
			vSpeed = lengthdir_y(_distanceTOGO, dir);
		}
		
		
		
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		EnemyTileCollision_nonAttk();
		
		//if (_distanceTOGO > eGiveUpRange) state = ENEMYSTATE.WANDER;
	}
	

}

function Slime_nonAttk_Hit() {
	sprite_index = sprHit;
	var _distanceTOGO = point_direction(x,y, xTo, yTo);
	
	if(_distanceTOGO > eSpeed){
		image_speed = 1.0;
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(eSpeed, dir);
		vSpeed = lengthdir_y(eSpeed, dir);
		if (hSpeed != 0) image_xscale = -sign(hSpeed);
		
		//collide and move, if collision -> stop
		if(EnemyTileCollision()){
			xTo = x;
			yTo = y;
			
		} else {
			x = xTo;
			y = yTo;
			if(statePrevious != ENEMYSTATE.ATTACK) state = statePrevious; else state = ENEMYSTATE.CHASE;
		}
	}
	
}

function Slime_nonAttk_Die() {
	sprite_index = sprDie;
	image_speed = 1.0;
	var _distanceTOGO = point_direction(x, y, xTo, yTo);
	if(_distanceTOGO > eSpeed){
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(eSpeed, dir);
		vSpeed = lengthdir_y(eSpeed, dir);
		if(hSpeed != 0) image_xscale = -sign(hSpeed);
		
		EnemyTileCollision_nonAttk();
	} else {
		x = xTo;
		y = yTo;
		
	}
	
	if(image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number){
		instance_destroy();
	}
}


