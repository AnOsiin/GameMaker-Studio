/// @description Insert description here
// You can write your code in this editor

if(titleVisible > 0){
	draw_sprite(Titles, 0, 0 , -RESOLUTION_H + titleVisible*RESOLUTION_H);
	draw_set_alpha(titleVisible * abs(sin(get_timer() * 0.000001 * pi)));
	draw_sprite(Titles, 1, 0, 0)
	draw_set_alpha(1.0)
}

if(slotVisible > 0){


//draw save slot
	draw_set_alpha(slotVisible)
	for (var _slot = 0; _slot <= 2; _slot++)
	{
		//draw slot box
		var _y = 16 + _slot * 48
		var _x = 160;
		var _img = 2;
		if(slotSeleted == _slot)
		{
			_img = 3;
			draw_sprite(MenuPlayerSLEC,0,_x-32,_y+24);
		}
	draw_sprite_stretched(TextBox, _img, _x, _y, 312, 48);
	
	
	//draw the save data
	draw_set_font(f_Text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	if(slotData[_slot] == -1) {
		draw_text(_x + 8, _y + 8, "Start new game!");
	} else {
		draw_text(_x + 8, _y + 8, RoomToArenaName(slotData[_slot] [? "room"]));
		
		//draw health
		var _playerHealth = slotData[_slot] [? "playerHealth"];
		var _playerHealthMax = slotData[_slot] [? "playerHealthMax"];
		var _playerHealthFrac = frac(_playerHealth);
		_playerHealth -= _playerHealthFrac;
		for(var i = 1; i <= _playerHealthMax; i++){
			var _imageIndex = (i > _playerHealth);
			if(i == _playerHealth+1){
				_imageIndex += (_playerHealthFrac > 0);
				_imageIndex += (_playerHealthFrac > 0.25);
				_imageIndex += (_playerHealthFrac > 0.5);
				
			}
			draw_sprite(Heart, _imageIndex, _x + 48 + ((i-1)*16), _y + 24);
		}
	//draw money
	draw_sprite(Coin, 0, _x + 12, _y + 28);
	draw_text(_x + 24, _y +22, slotData[_slot][? "playerMoney"]);
		
		
		}
	}
	draw_set_alpha(1.0);
}











