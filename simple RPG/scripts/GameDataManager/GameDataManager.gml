// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SaveGame(){
	//create save map
	var _map = ds_map_create();
	
		//location
	_map[? "room"] = room;
	_map[? "targetX"] = global.targetX;
	_map[? "targetY"] = global.targetY;
	
		//Player status
	_map[? "playerHealth"] = global.playerHealth;
	_map[? "playerHealthMax"] = global.playerHealthMax;
	_map[? "playerMoney"] = global.playerMoney;
	_map[? "playerItemUnlocked"] = global.playerItemsUnlock;
	_map[? "playerAmmo"] = global.playerAmmo;
	_map[? "playerEquipped"] = global.playerEqui;
	_map[? "playerHasAnyItems"] = global.playerHasAnyItems;
	
		//Quest status
	var _questMap = ds_map_create();
	ds_map_copy(_questMap, global.questStatus);
	ds_map_add_map(_map, "questStatus", _questMap);
	
	//Save eveeything to a string
	var _string = json_encode(_map);
	SaveStringToFiles("save" + string(global.gameSaveSlot) + ".sav", _string);
	show_debug_message(_string);
	
	//delete ds_map
	ds_map_destroy(_map);
	show_debug_message("game save!!!");
	
}

function SaveStringToFiles(_filename, _string) {
	var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}

function LoadGame(_slot) {
	global.gameSaveSlot = _slot;
	var _files = "save" + string(global.gameSaveSlot) + ".sav";
	if(file_exists(_files)){
		//load that game data
		var _jsonData = LoadJsonFromFiles(_files);
		
			//variable
		global.playerHealth = _jsonData[? "playerHealth"]
		//_jsonData[? "room"] = room;
		global.targetX = _jsonData[? "targetX"]
		global.targetY = _jsonData[? "targetY"]
		global.playerHealthMax = _jsonData[? "playerHealthMax"]
		global.playerMoney = _jsonData[? "playerMoney"] 
		//global.playerItemsUnlock = _jsonData[? "playerItemUnlocked"]
		//global.playerAmmo = _jsonData[? "playerAmmo"] 
		global.playerEqui = _jsonData[? "playerEquipped"] 
		global.playerHasAnyItems = _jsonData[? "playerHasAnyItems"] 
		
			//list to array
		for (var i = 0; i < ITEMS.TYPE_COUNT; i++){
			global.playerItemsUnlock[i] = _jsonData[? "playerItemUnlocked"] [| i];
			global.playerAmmo[i] = _jsonData[? "playerAmmo"] [| i];
		}
		
		//load quest data
		ds_map_copy(global.questStatus, _jsonData[? "questStatus"]);
		
		//room
		RoomTransition(TRANS_TYPE.SLIDE, _jsonData[? "room"]);
		ds_map_destroy(_jsonData);
		
		return true;
		
	} else{
		show_debug_message("No save file fount");
		return false;
	}
}

function LoadJsonFromFiles(_filename){
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _json = json_decode(_string);

	return _json;
}

function RoomToArenaName(_room){
	switch(_room){
		case Village_1: return "The Village"; break;
		case Village_2: return "The Village - River side"; break;
		case Village_3: return "The Village - Over grow"; break;
		case Cave_village_ent_1_A: return "The Village - Cave.Etrant"; break;
		default: return "Unknow Area"; break;
	}
}






