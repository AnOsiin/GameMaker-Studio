// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PurchaseItem(_item, _amount, _cost){
	if(global.playerMoney >= _cost){
		global.playerHasAnyItems = true;
		global.playerItemsUnlock[_item] = true;
		global.playerAmmo[_item] += _amount;
		global.playerMoney -= _cost;
		global.playerEqui = _item;
		instance_destroy(activate);
		
		var _desc = "";
		switch (_item) {
			case ITEMS.BOW: _desc = "The bow, a true classic range wepon.\nFire with th activate key."; break;
			case ITEMS.BOMB: _desc = "Carefull, black powder come in played!!!"; break;
			case ITEMS.HOOK: _desc = "Assassin perhap" break;
			default: _desc = "No item description found!"; break;
		}
		NewTextBox(_desc,1);
	} 
	else{
		NewTextBox("Not enough money....",1);
	}
}