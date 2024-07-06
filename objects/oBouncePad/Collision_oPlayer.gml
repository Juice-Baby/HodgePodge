/// @description BOUNCE
if sprite_index = sBouncePad{
	var dir = image_angle+180;
	with(other){
		dir = point_direction(x,y,x+hsp,y+vsp);
		var spd = point_distance(x,y,x+hsp,y+vsp);
		jumpSet(spd+1,dir);
		if object_index = oPlayer{
			rollTimer = max(rollTimer, 90);
		}
	}
	sprite_index = sBouncePadActive;
}


