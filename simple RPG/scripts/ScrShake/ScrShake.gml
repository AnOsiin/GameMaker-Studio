// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScrShake(Magnitude, Frames){
	with (global.iCamera) 
	{
	if (Magnitude > shakeRemain) 
	{
		shakeMagnitude = Magnitude; 
		shakeRemain = shakeMagnitude; 
		shakeLength = Frames; 
	
	}
}
}