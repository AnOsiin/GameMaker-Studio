// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CalcAttack(_maskindex){
	//Use hitbox & check for hits
	mask_index = _maskindex;
	var hitByAttack_Now = ds_list_create();
	var hits = instance_place_list(x, y, prEnity, hitByAttack_Now, false);
	if (hits > 0)
	{
		for (var i = 0; i < hits; i++){
			
			//Not yet ben hit by this attack, hit it
			var hitID = hitByAttack_Now[| i];
			//ds_list_find_value(hitByAttack_Now, i);
			
			if(ds_list_find_index(hitByAttack, hitID) == -1){
				ds_list_add(hitByAttack, hitID);
				with (hitID){
					if(object_is_ancestor(object_index, prEnemy)){
						HitEnemy (id, 5, other.id, 10);
						blend = c_red;
						blendtime=5;
					}
					/*if(object_is_ancestor(object_index, prEnity)){
						blend = c_white;
						blendtime=5;
					}*/
					
					if (eHitScripts != -1) script_execute(eHitScripts)
					
				}
			}
		}
	}
	
	ds_list_destroy(hitByAttack_Now)
	mask_index = Player_idle_all;
}

function AttackSla(){
	//Attack starts
	if (sprite_index != Player_attack_all){
		//Set up animation
		sprite_index = Player_attack_all;
		localFrame = 0;
		image_index = 0;
		
		//Clear hit
		if(!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create();
		ds_list_clear(hitByAttack);
		
	}

CalcAttack(Player_attack_all_HB);

//Update sprite
Player_animation();
if (animationEnd){
	state = PlayerStateFree;
	animationEnd = false;
}
}

function HitEnemy(_enemy, _damage, _source, _nockback){
	with (_enemy){
		if(state != ENEMYSTATE.DIE){
			eHP -= _damage;
			flash = 1;
			
			//enemy got hit or dead
			if(eHP <= 0){
				state = ENEMYSTATE.DIE;
			} else {
				if(state != ENEMYSTATE.HIT) statePrevious = state;
				state = ENEMYSTATE.HIT;
			}
			
			image_index = 0;
			if(_nockback != 0){
				var _nockDirection = point_direction(x, y, (_source).x, (_source).y);
				
				xTo = x - lengthdir_x(_nockback, _nockDirection);
				yTo = y - lengthdir_y(_nockback, _nockDirection);
			}
		}
	}
}
