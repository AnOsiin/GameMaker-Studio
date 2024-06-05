//skip event to prevent erro
if(skipStepEvent){
skipStepEvent = false
return
}
//Input
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));

keyActivate = keyboard_check_pressed(vk_space);
keyAttack = keyboard_check_pressed(ord("J"));
keyItem = keyboard_check_pressed(ord("K"));
keyGrap = keyboard_check(ord("L"));
keyItemSelec_UP = keyboard_check_pressed(ord("E"));
keyItemSelec_DOWN = keyboard_check_pressed(ord("Q"));

//inputDirection = point_direction(0,0, keyRight-keyLeft, keyUP-keyDown);
inputDirection = point_direction(0,0, keyRight-keyLeft, keyDown-keyUp);
inputMagnitude = (keyRight-keyLeft != 0) || (keyDown - keyUp != 0);


if (!global.gamePause) {
	script_execute(state);
	invulnerable = max(invulnerable - 1.0);
	flash = max(flash - 0.05, 0);
	
}
depth = -bbox_bottom;