// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyTileCollision(){
var _collision = false;
var _entityList = ds_list_create();

//Check horizontal
//if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y))
//{
	//x -= x mod TILES_SIZE;
//	if (sign(hSpeed) == 1) 
//	{
		//x += TILES_SIZE - 1;
//		hSpeed =  0;
//		_collision = true;
//	}
//}

	if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y))
	{	
		hSpeed = 0;
		_collision = true;	
	} 
	if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y))
	{	
		hSpeed = 0;
		_collision = true;	
	}

//Horizontal Entity
var _entityCount = instance_position_list(x + hSpeed, y, prEnity, _entityList, false);
var _snapX;
while (_entityCount > 0) {
	var _entityCheck = _entityList[| 0];
	if (_entityCheck.eCollision == true){
		if (sign(hSpeed) == -1) _snapX = _entityCheck.bbox_right + 1;
		else _snapX = _entityCheck.bbox_left - 1;
		x = _snapX;
		hSpeed = 0;
		_collision = true;
		_entityCount = 0;
		
	}
	ds_list_delete(_entityList, 0);
	_entityCount--;
}

// Commit horizontal
x += hSpeed;


ds_list_clear(_entityList);


//Check vertical

//if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
//{
	//y -= y mod TILES_SIZE;
//	if (sign(vSpeed) == 1) 
//	{
		//y += TILES_SIZE - 1;
//		vSpeed =  0;
//		_collision = true;
//	}
//}

if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
	{	
		vSpeed = 0;
		_collision = true;	
	}
	if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
	{	
		vSpeed = 0;
		_collision = true;	
	}

//Vertical Entity
var _entityCount = instance_position_list(x, y + vSpeed, prEnity, _entityList, false);
var _snapY;
while (_entityCount > 0) {
	var _entityCheck = _entityList[| 0];
	if (_entityCheck.eCollision == true){
		if (sign(vSpeed) == -1) _snapY = _entityCheck.bbox_bottom + 1;
		else _snapY = _entityCheck.bbox_top - 1;
		Y = _snapY;
		vSpeed = 0;
		_collision = true;
		_entityCount = 0;
		
	}
	ds_list_delete(_entityList, 0);
	_entityCount--;
}


// Commit vertical
y += vSpeed;

ds_list_destroy(_entityList);
return _collision;
}

function EnemyWait() {
	if (++stateWait >= stateWairDura)
	{
		stateWait = 0;
		state = stateTarget;
		
		
	}
}

function EnemyTileCollision_nonAttk(){
var _collision = false;

//horizontal
if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y))
	{	
		hSpeed = 0;
		_collision = true;	
	} 
	if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y))
	{	
		hSpeed = 0;
		_collision = true;	
	}

// Commit horizontal
x += hSpeed;

//Vertical
if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
	{	
		vSpeed = 0;
		_collision = true;	
	}
	if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
	{	
		vSpeed = 0;
		_collision = true;	
	}
// Commit vertical
y += vSpeed;
/*//stop if gets to close
if(point_distance(x,y,OsPlayer.x,OsPlayer.y) <= eAggroRadius / 3){
		x = xprevious;
		y = yprevious;
}*/
return _collision;
}

