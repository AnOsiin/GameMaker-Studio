// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CollectCoins(_amount){
	global.playerMoney += _amount;
}

function CollectAmmo(_array){ //_array = [type, amout]
	global.playerAmmo[_array[0]]+= _array[1];
}

function CollectHealingHeart(_amount){
	if(global.playerHealth < global.playerHealthMax) global.playerHealth += _amount;
	if(global.playerHealth > global.playerHealthMax) global.playerHealth = global.playerHealthMax;
}

function CollectHealthInc(_amount){
	global.playerHealthMax += _amount;
	global.playerHealth = global.playerHealthMax;
}

