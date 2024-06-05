/// @description Insert description here
// You can write your code in this editor

//eLoop
if (!global.gamePause){
	depth = -bbox_bottom;
	
	if(lifted) && (instance_exists(OsPlayer))
	{
		eCollision = false;
		if(OsPlayer.sprite_index != Player_hold_idle_all){
			x = OsPlayer.x;
			y = OsPlayer.y;
			z = 13;
			depth = OsPlayer.depth - 1;
		}
	}
	
	if(!lifted){
		//been throw
		if(thrown){
			throwDistanceTravelld = min(throwDistanceTravelld + 3, throwDistance)
			x = xstart + lengthdir_x(throwDistanceTravelld, direction);
			y = ystart + lengthdir_y(throwDistanceTravelld, direction);
			if(tilemap_get_at_pixel(collisionMap, x, y) > 0){
				thrown = false;
				grav = 0.1;
			}
			
			throwPercent = throwStartPercent + lerp(0, 1 - throwStartPercent, throwDistanceTravelld / throwDistance);
			z = throwpHeight * sin(throwPercent * pi);
			if (throwDistance == throwDistanceTravelld){
				thrown = false;
				if(eThrowBreak) instance_destroy();
				
			}
		} else {
			//grav
			if (z > 0){
				z = max (z - grav, 0)
				grav += 0.1;
				if (z == 0) && (eThrowBreak) instance_destroy();
			} else {
				grav = 0.1;
			}
		}
	}
}

flash = max(flash - 0.04, 0);




