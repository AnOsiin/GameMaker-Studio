/// @description Insert description here
// You can write your code in this editor



if(!keyPressed){
	titleVisible = min (1, titleVisible + 0.01);

} else {
	titleVisible = max (0, titleVisible - 0.01);
	slotVisible = min (1, slotVisible + 0.01);
}

//select mov
if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))){
	slotSeleted -= 1;
	if(slotSeleted < 0) slotSeleted = 2;
	
}
if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))){
	slotSeleted += 1;
	if(slotSeleted > 2) slotSeleted = 0;
	
}

if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) && (keyPressed) && (!loadingStarted){
	global.gameSaveSlot = slotSeleted;
	if(!LoadGame(global.gameSaveSlot)){
		RoomTransition(TRANS_TYPE.SLIDE, Village_1);
	}
	loadingStarted = true;
}

if(keyboard_check_pressed(vk_anykey)) keyPressed = true;







