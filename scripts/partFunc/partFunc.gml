// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function animEndPart(_spr,_ang,_dir,_spd,_frc){
	var ef = instance_create_depth(x,y,depth,oAnimEnd);
	with(ef){
		sprite_index = _spr;
		image_angle = _ang;
		direction = _dir;
		speed = _spd;
		friction = _frc;
	}
	return ef;
}
function timePart(_spr,_time,_ang,_dir,_spd,_frc){
	var ef = instance_create_depth(x,y,depth,oTimeEnd);
	with(ef){
		sprite_index = _spr;
		image_angle = _ang;
		direction = _dir;
		speed = _spd;
		friction = _frc;
		alarm[0] = _time;
	}
	return ef;
}
function fadePart(_spr,_time,_ang,_dir,_spd,_frc){
	var ef = instance_create_depth(x,y,depth,oFadeEnd);
	with(ef){
		sprite_index = _spr;
		image_angle = _ang;
		direction = _dir;
		speed = _spd;
		friction = _frc;
		fade = _time;
		alarm[0] = _time;
	}
	return ef;
}
function scaleSize(spr,size){
	var m = sprite_get_width(spr)/size;
	image_xscale = m;
	image_yscale = m;
	return m;
}
function drawAlign(_ha=fa_left,_va=fa_top,_font=fInfo){
	draw_set_font(_font);
	draw_set_halign(_ha);
	draw_set_valign(_va);
}
function soundPitched(sid,pri,pitch){
	if global.mute{ exit }
	var s = audio_play_sound(sid,pri,false);
	audio_sound_pitch(s,pitch);
	return s;
}


