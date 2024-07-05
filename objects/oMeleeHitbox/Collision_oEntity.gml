/// @description KNOCKBACK
var o = other;
if o!=creator and ds_list_find_index(hitList,o)=-1{
	ds_list_add(hitList,o);
	var dir = point_direction(x,y,o.x,o.y);
	with(o){
		jumpAdd(other.knockback,dir);
		hp-=other.damage;
		if hp<=0{
			instance_destroy();
		}else{
			repeat(3){
				var d = animEndPart(
				sDust,irandom(359),dir+irandom_range(-35,35),2+random(1),.1);
				d.image_index = 2+random(1);
			}
		}
	}
}


