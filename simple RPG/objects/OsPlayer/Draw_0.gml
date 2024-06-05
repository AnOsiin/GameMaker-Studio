/// @description Insert description here
// You can write your code in this editor

//HookShot - befor
if(state == PlayerStateHooked) &&(image_index != 3) DrawHookChains();

if(invulnerable != 0) && ((invulnerable mod 8 < 2) == 0) && (flash ==0)
{
	//skip draw
} else {
draw_sprite_ext(
	sprite_index,
	image_index,
	floor(x),
	floor(y-z),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha)
}

//HookShot - after
if(state == PlayerStateHooked) &&(image_index == 3) DrawHookChains();

function DrawHookChains() {
	var _originX = floor(x);
	var _originY = floor(y)-7;
	var _chains = hook div hookSize;
	var _hookDirX = sign(hookX);
	var _hookDirY = sign(hookY);
	for(var i = 0; i < _chains; i++){
		draw_sprite(
			HookChains,
			0,
			_originX + hookX - (i * hookSize * _hookDirX),
			_originY + hookY - (i * hookSize * _hookDirY)
		);
	}
	draw_sprite(HookBlades, image_index, _originX + hookX, _originY + hookY);
}







