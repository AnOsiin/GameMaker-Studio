/// @description Insert description here
// You can write your code in this editor
if (eShadow) draw_sprite(Shadow, 0, floor(x) ,floor(y));

/*if(flash != 0){
	shader_set(shWhiteFlash);
	uFlash = shader_set_uniform(flashShader, "flash");
	shader_set_uniform_f(uFlash, flash);
	draw_self();
	
	shader_reset();
} else draw_self();*/

draw_sprite_ext(
	sprite_index,
	image_index,
	floor(x),
	floor(y-z),
	image_xscale,
	image_yscale,
	image_angle,
	blend,
	image_alpha
);

//if(shader_current() != -1) shader_reset();







