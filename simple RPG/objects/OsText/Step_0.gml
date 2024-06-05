/// @description Insert description here
// You can write your code in this editor
lerpProgess += (1 - lerpProgess) / 50;
textProgess += global.textSpeed;

x1 = lerp(x1, x1Target, lerpProgess)
x2 = lerp(x2, x2Target, lerpProgess)

//cycle respones
keyUp = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
keyDown = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
responesSelected += (keyDown - keyUp);
var _array = responses;

var _max = array_length(respones) - 1
var _min = 0
if (responesSelected > _max) responesSelected = _min;
if (responesSelected < _min) responesSelected = _max;

if(keyboard_check_pressed(vk_space))
{
	var _messageLength = string_length(messageNew)
	if (textProgess >= _messageLength){
		if(respones[0] != -1){
			with(originInstance) DialogResponses(other.responseScripts[other.responesSelected]);
		}
		
		instance_destroy();
		if(instance_exists(OsTextQ))
		{
			with (OsTextQ) ticket --;
		} else {
			with(OsPlayer) {
				state = lastState
				skipStepEvent = true
}
		}
	} else {
		if (textProgess > 2){
			textProgess = _messageLength;
			}
		}	
}





