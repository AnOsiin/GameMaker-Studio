//Pause game
if (keyboard_check_pressed(vk_escape)) && (!instance_exists(OsTransition) && (OsUI.visible == true))
{
	global.gamePause = !global.gamePause;
	if (global.gamePause)
	{
		with (all)
		{
			gamePauseImageSpeed = image_speed;
			image_speed = 0;
		
		}
	} else
	{
		with (all)
		{
			image_speed = gamePauseImageSpeed;

		}
	}
}




