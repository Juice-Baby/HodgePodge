// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createDrops(_a=[],_disVari=10){
	var ar = _a;
	var i = 0;
	var s = array_length(ar);
	var _x = 0;
	var _y = 0;
	var sx = x+sprite_width/2;
	var sy = y+sprite_height/2;
	var _ang = 0;
	repeat(s){
		var it = ar[i];
		_ang = irandom(359);
		_x = sx+lengthdir_x(irandom(_disVari),_ang);
		_y = sy+lengthdir_y(irandom(_disVari),_ang);
		var dr = instance_create_depth(_x,_y,depth+1,oDrop);
		with(dr){
			setup(it);
		}
		i++;
	}
}
function itemInit(_id){
	switch(_id){
		case resource.gems:
			image_blend = make_color_hsv(irandom(255),255,255);
			break;
	}
}
function gainEnergy(_nrg){
	global.energy = approach(global.energy,global.energyMax,_nrg);
}
function playerPickedUp(_id){
	switch(_id){
		case resource.engine:
			gainEnergy(50);
			break;
		case resource.gems:
			gainEnergy(2);
			break;
	}
}


