// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SkeletonWander(){
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
		EnemyTileCollision();
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

function SkeletonChase(){
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
		EnemyTileCollision();
		
		if (_distanceTOGO > eGiveUpRange) && (state != ENEMYSTATE.ATTACK) state = ENEMYSTATE.WANDER;
	}
	
//Check distance to perform attack - close enoght
if (instance_exists(target)) && (point_distance(x, y, target.x, target.y) <= eAttackRadius)
{
	state = ENEMYSTATE.ATTACK;
	sprite_index = sprAttack;
	image_speed = 1.0;
	
	//target 8px past the player
	//xTo += lengthdir_x(8, dir);
	//yTo += lengthdir_y(8, dir);
}

}


function SkeletonAttack() {
	var _spd = eSpeed;
	if (image_index < 2) _spd = 0;
	mask_index = Skeleton_attack_HB;
	var _list = ds_list_create();
	var _hits = instance_place_list(x, y, OsPlayer, _list, false)
	if(_hits > 0){
		show_debug_message("player got hit")
	}
	ds_list_destroy(_list);
	
	if(floor(image_index) == 4){
			mask_index = Skeleton_idle;
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDura = 15;
			state = ENEMYSTATE.WAIT;
		}
}



