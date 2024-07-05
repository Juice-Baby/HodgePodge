// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shakeSet(shk,shkPer,shkFlat){
	with(oCamera){
		shake += shk;
		shakePer = shkPer;
		shakeFlat = shkFlat;
	}
}
function jumpSet(l,d){
	hsp = lengthdir_x(l,d);
	vsp = lengthdir_y(l,d);
}
function jumpAdd(l,d){
	hsp += lengthdir_x(l,d);
	vsp += lengthdir_y(l,d);
}
function jumpApr(l,d,m){
	hsp = approach(hsp,lengthdir_x(l,d),m);
	vsp = approach(vsp,lengthdir_y(l,d),m);
}
function jump(l,d){
	x += lengthdir_x(l,d);
	y += lengthdir_y(l,d);
}
function saveSprite(){
	var data = [sprite_index,image_index,image_xscale,image_yscale,image_angle];
	return data;
}
function loadSprite(data){
	sprite_index = data[0];
	image_index = data[1];
	image_xscale = data[2];
	image_yscale = data[3];
	image_angle = data[4];
}
function tryMove(dx,dy,obj){
	var spr = saveSprite();
	x+=dx;
	y+=dy;
	if place_meeting(x,y,obj){
		x-=dx;
		y-=dy;
		loadSprite(spr);
		return false;
	}
	loadSprite(spr);
	return true;
}
function follow(i){
	if !instance_exists(i){
		instance_destroy();
		exit;
	}
	x = i.x;
	y = i.y;
}
function followLerp(i,per){
	if !instance_exists(i){
		instance_destroy();
		exit;
	}
	x = lerp(x,i.x,per);
	y = lerp(y,i.y,per);
}


