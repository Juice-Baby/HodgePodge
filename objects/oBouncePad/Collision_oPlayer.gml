/// @description BOUNCE
if sprite_index = sBouncePad{
	var dir = image_angle+180;
	with(other){
		dir = point_direction(x,y,x+hsp,y+vsp);
		var spd = point_distance(x,y,x+hsp,y+vsp);
		jumpSet(spd+1,dir);
	}
	sprite_index = sBouncePadActive;
}


