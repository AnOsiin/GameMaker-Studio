/// @description Insert description here
// You can write your code in this editor

if (!global.gamePause)
{
	
	image_speed = 1.0
	//HIT THINGS
	if (image_index < 4)
	{
		var _entityList = ds_list_create();
		var _entityCount = instance_place_list(x,y,prEnity,_entityList,false);
		var _entity = noone;
		while (_entityCount > 0)
		{
			_entity = _entityList[| 0];
			if (ds_list_find_index(collisionHistory, _entity) == -1)
			{
				with (_entity)
				{
					if (object_is_ancestor(object_index,prEnemy))
					{
						HitEnemy(id,25,other.id,20);
					}
					else
					{
						if (eHitScripts != -1) script_execute(eHitScripts);
					}
				}
				ds_list_add(collisionHistory,_entity);
			}
			ds_list_delete(_entityList,0);
			_entityCount--;
		}
		ds_list_destroy(_entityList);
	}
}
else
{
	image_speed = 0.0;
}

depth = -bbox_bottom








