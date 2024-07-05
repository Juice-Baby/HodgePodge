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
		}
	}
	pierce--;
	if pierce<1{
		instance_destroy();
	}
}


