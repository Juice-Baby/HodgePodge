/// @description Drops
if irandom(1)=0{
	var w = sprite_width;
	var h = sprite_height;
	var k = instance_create_depth(x+w/2,y+h/2,depth+1,oDrop);
	var _r = choose(resource.gems,resource.key);
	with(k){
		setup(_r);
	}
}


