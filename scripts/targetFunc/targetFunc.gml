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


