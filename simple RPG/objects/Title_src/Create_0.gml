/// @description Insert description here
// You can write your code in this editor


titleVisible = 0.0;
keyPressed = false;
slotVisible = 0.0;
slotSeleted = 0;
loadingStarted = false;
for (var _slot = 0; _slot <= 2; _slot++){
	var _filename = "save" + string(_slot) + ".sav";
	if(file_exists(_filename)){
		slotData[_slot] = LoadJsonFromFiles(_filename);
		
	} else slotData[_slot] = -1;
}

depth = -bbox_bottom -10





