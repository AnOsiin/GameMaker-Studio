/// @description Insert description here
// You can write your code in this editor

//draw_sprite_stretched(TextBox, x1, y1, x2, y2, background);
draw_sprite_stretched(TextBox, background, x1, y1, x2 - x1, y2 - y1);
draw_set_font(f_Text);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _print = string_copy(messageNew, 1, textProgess);

if  (respones[0] != -1) && (textProgess >= string_length(messageNew))
{
	for(var i = 0; i < array_length(respones); i++)
	{
		_print += "\n";
		if (i == responesSelected) _print += "> ";
		_print += respones[i];
		if (i == responesSelected) _print += " <";
	}
}

draw_text((x1 + x2) / 2, y1 + 8, _print);
draw_set_color(c_white);
draw_text((x1 + x2) / 2, y1 + 7, _print);



