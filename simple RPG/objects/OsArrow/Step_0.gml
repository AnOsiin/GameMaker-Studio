/// @description Insert description here
// You can write your code in this editor

var _enity = instance_place(x, y, prEnity);
var _break = false;

if(_enity != noone){
	with(_enity){
		if(object_is_ancestor(object_index, prEnemy)){
			HitEnemy(id, 10, other.id, 20);
			_break = true;
		} else {
			if(eHitScripts != -1){
				script_execute(eHitScripts);
				_break = true;
		
			}
			
		}
	}
	if(_break) instance_destroy();
}

//destroy if leave camera bound
var _cam = view_camera[0];
var _camX = camera_get_view_x(_cam);
var _camY = camera_get_view_y(_cam);
if ( !point_in_rectangle( x, y, _camX, _camY, _camX + camera_get_view_width(_cam), _camY + camera_get_view_height(_cam))) {
	instance_destroy();
}







