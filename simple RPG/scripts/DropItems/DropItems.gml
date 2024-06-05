// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DropItems(item_x,item_y,item,obj){
	
	if(item > 1)
	{
		var _anglePerItem = 360/item;
		var _angle = random(360);
		for (var i = 0; i < item; i++)
		{
			with(instance_create_layer(item_x, item_y, "Instances",obj))
			{
				direction = _angle;
				spd = 0.75 + (item * 0.1) + random(0.1);
			}
			_angle += _anglePerItem;
		}
		
		
	}else instance_create_layer(item_x, item_y, "Instances",obj);
	

}	

function DropItems_Random(item_x, item_y, _items){
	var _itemsCount= array_length(_items);
	if(_itemsCount >1){
		var _anglePerItem = 360/_itemsCount;
		var _angle = random(360);
		for (var i = 0; i < _itemsCount; i++){
			with(instance_create_layer(item_x, item_y, "Instances",_items[i])){
				direction = _angle;
				spd = 0.75 + (_itemsCount * 0.1) + random(0.1);
			}
			_angle += _anglePerItem;
		}
	} else instance_create_layer(item_x, item_y, "Instances",_items[0]);
}


function Player_DropItem(){
	with(OsPlayer){
				global.iLift = noone;
				sIdle = Player_idle_all;
				sWalk = Player_walk_all;
			}
}