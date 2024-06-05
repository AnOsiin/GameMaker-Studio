/// @description Insert description here
// You can write your code in this editor
/* old code
if (!global.gamePause)
{
	//bounce
	if(bounceCount != 0){
		bounce += (pi * bounceSpeed);
		bounceHeight *= 0.6;
		bounceCount--;
	}
	z = sin(bounce) * bounceHeight;
} else z = 0;

//Deteriorate 
deteriorate++;
if(deteriorate > deteriorateAfter){
	image_alpha -= 1/deteriorateTime;
	if (image_alpha <= 0) instance_destroy();
}

//friction
fric = 0.05;
if(z==0) fric = 0.10;

//move 
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
if(tilemap_get_at_pixel(collisionMap, x, y) > 0) spd = 0;
spd = max (spd - fric, 0);

*/

if (!global.gamePause)
{
	//Deteriorate
	deteriorate++;
	
	if (deteriorate > deteriorateAfter)
	{
		image_alpha -= 1/deteriorateTime;	
		if (image_alpha <= 0) instance_destroy();
	}
	
	//Bounce
	if (bounceCount > 0)
	{
		bounce += pi * bounceSpeed;
		
		if (bounce > pi)
		{
			bounce -= pi;
			bounceHeight *= 0.6;
			bounceCount--;
		}
		
		z = sin(bounce) * bounceHeight;
	}
	else
		z = 0;
	
	//Move
	if (spd > 0)
	{
		hSpeed = lengthdir_x(spd, direction);
		vSpeed = lengthdir_y(spd, direction);
		
		if (tilemap_get_at_pixel(collisionMap, x+hSpeed, y))
		{
			x -= x mod TILES_SIZE;
			if (hSpeed > 0) x += TILES_SIZE - 1;
			spd = 0;
		}
		else
			x += hSpeed;
		
		if (tilemap_get_at_pixel(collisionMap, x, y+vSpeed))
		{
			y -= y mod TILES_SIZE;
			if (vSpeed > 0) y += TILES_SIZE - 1;
			spd = 0;
		}
		else
			y += vSpeed;
		
		if (spd > 0)
		{
			//Friction
			if (z == 0)
				fric = 0.1;
			else
				fric = 0.05;
			
			spd -= fric;
		}
	}
}





