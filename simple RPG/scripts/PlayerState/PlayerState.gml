// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateFree(){
	
//Movement
hSpeed = lengthdir_x(inputMagnitude * speedWalking, inputDirection);
vSpeed = lengthdir_y(inputMagnitude * speedWalking, inputDirection);

//x += hSpeed;
//y += vSpeed;
PlayerCollision();

//Update sprite index
var _oldSprite = sprite_index;
if (inputMagnitude != 0)
{
	direction = inputDirection;
	sprite_index = sWalking;
} else sprite_index = sIdle;

if (_oldSprite != sprite_index) localFrame = 0;

//Update image index
Player_animation();

//Attack key logic
if(keyAttack){
	state = PlayerStateAttack;
	stateAttack = AttackSla;
}


//Change state
//if (keyActivate){
//	state = PlayerRoll
//}
if (keyActivate){      //Activate key logic
	//check for an Enity to activate
	//nothing or have something , but it dosn't have an activate script - for futrue state
	    //if carry something, throw it
		//orthewise....
	//otherwise, something and it has a scripts - Activate
	//if the one activate is an NPC, make NPC face player
	
	var _activateX = lengthdir_x(10, direction);
	var _activateY = lengthdir_y(10, direction);
	var _activateSize = 4;
	var _activateList = ds_list_create();
	activate = noone; 
	var _eFound = collision_rectangle_list(
		_activateX - _activateSize,
		_activateY - _activateSize,
		_activateX + _activateSize,
		_activateY + _activateSize,
		prEnity,
		false,
		true,
		_activateList,
		true
	);
	//if 1st instance we find is lifted entity or hav no spcripts -> try next one
	while (_eFound > 0) {
		var _check = _activateList[| --_eFound];
		if (_check != global.iLift) && (_check.eActivateScripts != -1) {
			activate = _check;
			break;
			
		}
	}
	ds_list_destroy(_activateList);
	
	activate = instance_position(x+_activateX, y-8+_activateY, prEnity);
	
	if(activate == noone || activate.eActivateScripts == -1){
		if(global.iLift != noone) {
			PlayerThrow();
			
		} else{
		state = PlayerStateFree; //change it if hav diff state in future
		}
	} else {
		ExecuteArray(activate.eActivateScripts, activate.eActivateArgs);
		//make an NPC face player
		if(activate.eNPC)
		{
			with (activate)
			{
				direction = point_direction(x, y, other.x, other.y);
				image_index = CARDINAL_DIR
			}
		}
	}
 }
 
 //Use items
 if(keyItem) && (!keyActivate) && (global.playerHasAnyItems) && (global.playerEqui != ITEMS.NONE){
	switch (global.playerEqui){
		case ITEMS.BOMB: UseItemBOMB(); break;
		case ITEMS.BOW: UseItemBOW(); break;
		case ITEMS.HOOK: UseItemHOOK(); break;
		default: break;
	}
 }
 
 //cycel items
 if(global.playerHasAnyItems){
	var _cycleDir = keyItemSelec_UP - keyItemSelec_DOWN;
	if(_cycleDir != 0){
		do{
			global.playerEqui += _cycleDir;
			if(global.playerEqui < 1) global.playerEqui = ITEMS.TYPE_COUNT - 1;
			if(global.playerEqui >= ITEMS.TYPE_COUNT) global.playerEqui = 1;
		} until (global.playerItemsUnlock[global.playerEqui]);
	}
 }
 //grabbed obj
 if (keyGrap) && (direction mod 90 == 0) {
	var _grapX = x + lengthdir_x(12, direction);
	var _grapY = y + lengthdir_y(12, direction);
	
	grapped = instance_position(_grapX, _grapY, prPush);
	
	if(grapped != noone){
		state = PlayerStatePush;
	}
 }
}

function PlayerStateLocked(){
//do nothing
//checkpoints for state
}

function PlayerStateBonk(){
	
	hSpeed = lengthdir_x(speedBonk, direction-180);
	vSpeed = lengthdir_y(speedBonk, direction-180);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedBonk);
	var _collied = PlayerCollision();
	
	sprite_index = Hit_all;
	image_index = CARDINAL_DIR - 2;
	
	if(moveDistanceRemaining <= 0){
		state = PlayerStateFree;
	}
}

function PlayerStateAttack(){
	script_execute(stateAttack);
}

function PlayerRoomTransition(){
	PlayerCollision();
	
//Update image index
	Player_animation();
}

function PlayerStateAct(){
	Player_animation()
	if(animationEnd) {
		state = PlayerStateFree;
		animationEnd = false;
		if(animationEnd != 1){
			script_execute(animationEnd);
			animationEnd= -1;
		}
	}
}

function PlayerStateDead(){
	
	hSpeed = 0;
	vSpeed = 0;
	//just arrive in this state
	if(sprite_index != PlayerDEAD){
	sprite_index = PlayerDEAD;
	image_speed = 0.5;
	image_index = 0;
	global.targetX = -1; 
	global.targetY = -1;
	RoomTransition(TRANS_TYPE.SLIDE, Village_1);
	}
	
}

function PlayerStateHooked(){
	hSpeed = 0;
	vSpeed = 0;
	
	//just arriving to hook state
	if(sprite_index != Player_Hook_temp){
		hook = 0;
		hookX = 0;
		hookY = 0;
		hookStatus = HOOKSTATUS.EXTENING;
		hookedEnity = noone;
		
		//uodate sprite
		sprite_index = Player_Hook_temp;
		image_index = CARDINAL_DIR;
		image_speed = 0;
	}
	
	//Extend/retract hook: !!!!!importan
	var _speedHookTemp = speedHook;
	if(hookStatus != HOOKSTATUS.EXTENING) _speedHookTemp *= -1;
	hook += _speedHookTemp;
	switch (image_index){
		case 0: hookX = hook; break;
		case 1: hookY = -hook; break;
		case 2: hookX = -hook; break;
		case 3: hookY = hook; break;
		
	}
	
	//Hookshot state
	switch(hookStatus){
		case HOOKSTATUS.EXTENING: {
			//finish
			if(hook >= distanceHook) hookStatus = HOOKSTATUS.MISS;
			
			//check for hit
			var _hookHIT = collision_circle(x+hookX, y+hookY, 4, prEnity, false, true);
			if(_hookHIT != noone) && (global.iLift != _hookHIT){
				
			//act depending on what is hit
			switch (_hookHIT.eHookAble){
				default: //not hookable
				{
					//... else potentially harm enemy
					if (object_is_ancestor(_hookHIT.object_index,prEnemy)){
						HitEnemy(_hookHIT,1,id,5);
						hookStatus = HOOKSTATUS.MISS;
						
						
					} else{
						if (_hookHIT.eHitScripts != -1){
							with (_hookHIT) script_execute(eHitScripts)
							hookstatus = HOOKSTATUS.MISS;
							
						}					
					}			
				}break;
				case 1:{
					hookStatus = HOOKSTATUS.PULLTOPLAYER
					hookedEnity = _hookHIT;
					
				}break;
				case 2:{
					hookStatus = HOOKSTATUS.PULLTOENITY;
					hookedEnity = _hookHIT;
				}break;
			   }
			}
		} break;
		
		//pull enity to player
		case HOOKSTATUS.PULLTOPLAYER: {
			with (hookedEnity){
				x = other.x + other.hookX;
				y = other.y + other.hookY;
			}
		} break;
		
		//pull player to hooker enity
		case HOOKSTATUS.PULLTOENITY: {
				switch (image_index){
					case 0: x += speedHook; break;
					case 1: y -= speedHook; break;
					case 2: x -= speedHook; break;
					case 3: y += speedHook; break;
				}
		} break;
	}
	
	//finish retract and end the state
	if(hook <= 0){
		hookedEnity = noone;
		state = PlayerStateFree;
	}
}

function PlayerStatePush(){
//Update sprite index
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0)
	{
		direction = inputDirection;
		sprite_index = sWalking;
	} else sprite_index = sIdle;

	if (_oldSprite != sprite_index) localFrame = 0;

//Update image index
	Player_animation();
	

	
//cacl movement
	if(inputDirection == direction) || (inputDirection == direction-180) || (inputDirection == direction+180)  {
		hSpeed = lengthdir_x(inputMagnitude * speedPush, inputDirection);
		vSpeed = lengthdir_y(inputMagnitude * speedPush, inputDirection);
		
	} else {
		hSpeed = 0;
		vSpeed = 0;
	}

//commit to the mov
	PlayerCollision();
	with (grapped){
		collisionMap = other.collisionMap;
		hSpeed =  other.hSpeed;
		vSpeed = other.vSpeed;
		var _gX = x + hSpeed;
		var _gY = y + vSpeed;
		
		grapped = id; 
		var _grapCol = PlayerCollision();
	
		if(_grapCol){
			x -= _gX - grapped.x;
			y -= _gY - grapped.y;
		}
		
		
	}
	
	if(!keyGrap){
		state = PlayerStateFree;
		grapped = noone;
	}

}


