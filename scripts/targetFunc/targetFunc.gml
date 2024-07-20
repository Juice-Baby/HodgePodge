// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function targetNearest(_x,_y,_obj){
	var ls = instance_nearest_list(_x,_y,_obj);
	var s = ds_list_size(ls);
	var i = 0;
	var tar = noone;
	do{
		var e = ds_list_find_value(ls,i);
		if e!=id{
			tar = e;
		}else{
			i++;
		}
	}until i=s or tar!=noone;
	return tar;
}
function targetNearestExcluding(_x,_y,_obj,_exclude){
	var ls = instance_nearest_list(_x,_y,_obj);
	var s = ds_list_size(ls);
	var i = 0;
	var tar = noone;
	do{
		var e = ds_list_find_value(ls,i);
		//IF YOU'RE NOT ME, AND YOU'RE NOT THE OBJECT IM EXCLUDING,
		//THEN TARGET YOU
		if e!=id and e.object_index != _exclude{
			tar = e;
		}else{
			i++;
		}
	}until i=s or tar!=noone;
	return tar;
}
function targetNearestLineOfSightExcluding(_x,_y,_obj,_coll,_exclude){
	var ls = instance_nearest_list(_x,_y,_obj);
	var s = ds_list_size(ls);
	var i = 0;
	var tar = noone;
	do{
		var e = ds_list_find_value(ls,i);
		//IF YOU'RE NOT ME, AND YOU'RE NOT THE OBJECT IM EXCLUDING,
		//THEN TARGET YOU
		var lineOfSight = collision_line(x,y-6,e.x,e.y,_coll,false,true);
		if e!=id and e.object_index != _exclude and lineOfSight=noone{
			tar = e;
		}else{
			i++;
		}
	}until i=s or tar!=noone;
	return tar;
}


