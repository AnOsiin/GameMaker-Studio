/// @description  draw UI
// You can write your code in this editor


//draw healtth
var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
var _playerHealthFrac = frac(_playerHealth); // from 1 -> to 1.0
_playerHealth -= _playerHealthFrac;

for (var i = 1; i <= _playerHealthMax; i++) {
	var _imageIndex = (i > _playerHealth); //return 1 or 0 || true or false
	if(i == _playerHealth + 1){
		_imageIndex += (_playerHealthFrac > 0);
		_imageIndex += (_playerHealthFrac > 0.25);
		_imageIndex += (_playerHealthFrac > 0.5);
	}
	draw_sprite(Heart, _imageIndex, 8+((i-1)*16), 8)
}

//draw Coins
var _xx, _yy;
	//coin icon
	_xx = 30;
	_yy = 31;
	draw_sprite(CoinUI, 0, _xx, _yy);
	
	//coin texy
	draw_set_color(c_black);
	draw_set_font(f_Text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	_xx += sprite_get_width(CoinUI) + 4;
	_yy = 29;
	
	var _str = string(global.playerMoney);
	draw_text(_xx+1, _yy, _str);
	draw_text(_xx-1, _yy, _str);
	draw_text(_xx, _yy+1, _str);
	draw_text(_xx, _yy-1, _str);
	draw_set_color(c_white);
	draw_text(_xx, _yy, _str);
	
//draw ITEMS ui
	_xx = 8;
	_yy = 29;
	
	draw_sprite(ItemUI_box, 0, _xx, _yy);
	
	if(global.playerHasAnyItems){
		draw_sprite(ItemUI_items, global.playerEqui, _xx, _yy)
		if(global.playerAmmo[global.playerEqui] != 1){
			draw_set_font(AmmoCount);
			draw_set_halign(fa_right);
			draw_set_valign(fa_bottom);
			draw_set_color(c_white);
			draw_text(
				_xx + sprite_get_width(ItemUI_box)+1,
				_yy + sprite_get_height(ItemUI_box)+1,
				string(global.playerAmmo[global.playerEqui])
			)
		}
	}
	
//Draw pause menu
if (global.gamePause)
{
	draw_set_color(c_black )
	draw_set_alpha(0.75)
	draw_rectangle(0,0,RESOLUTION_W,RESOLUTION_H,false)
	draw_set_alpha(1.0)
	draw_set_color(c_white )
	draw_set_font(f_Text)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	
	draw_text(RESOLUTION_W * 0.5,RESOLUTION_H * 0.5,"~~~~~Game Paused~~~~~");
	for(var i = 0; i < array_length(pauseOption); i++)
	{
		var _print = "";
		if (i == pauseOptionSelected)
		{
			_print +="> " + pauseOption[i] + " <"
		}
		else
		{
			_print += pauseOption[i];
			draw_set_alpha(0.7)
		}
		draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5 +18 + (i *  12) , _print)
		draw_set_alpha(1.0)
	}	
}





