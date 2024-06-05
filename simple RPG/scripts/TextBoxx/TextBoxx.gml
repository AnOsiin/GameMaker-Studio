function NewTextBox(_message, _background = 1, _responses = []){
/// @arg message
/// @arg background
/// @arg [respones]
//if (!OsPlayer.textBoxDelay)
//{
	var _obj;
	if (instance_exists(OsText))
	{
		_obj = OsTextQ;
	}	
	else
	{
		_obj = OsText;
	}

	with (instance_create_layer(0,0,"Instances",_obj))
	{
		originInstance = instance_exists(other) ? other.id : noone;
		messageNew = _message;
		background = _background;
		respones= [-1];
		responseScripts = [-1];
		l = array_length(_responses);
			
		if (l > 0)
		{
			array_copy(respones, 0, _responses, 0, l);
			
			for (var i=0; i<l; ++i)
			{
				var _markerPosition = string_pos(":", respones[i]);
				responseScripts[i] = real(string_copy(respones[i], 1, _markerPosition-1));
				respones[i] = string_delete(respones[i], 1, _markerPosition);
			}
		}
	}

	with(OsPlayer)
	{
		if(state != PlayerStateLocked)
		{
			lastState = state;
			state = PlayerStateLocked;
		}
	}
//}
}