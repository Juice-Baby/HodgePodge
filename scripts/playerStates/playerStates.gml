// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerMovement(){
	if !move{ exit }
	var mh = keyboard_check(ord("D"))-keyboard_check(ord("A"));
	var mv = keyboard_check(ord("S"))-keyboard_check(ord("W"));
	var moving = (mh!=0)or(mv!=0);
	if !moving{
		sprite_index = sPlayer;
		var spd = 0;
		var dir = point_direction(x,y,x+hsp,y+vsp);
		var amount = deaccel;
		jumpApr(spd,dir,amount);
	}else{
		sprite_index = sPlayerMoving;
		var spd = topSpeed;
		var dir = point_direction(x,y,x+mh,y+mv);
		var amount = accel;
		jumpApr(spd,dir,amount);
	}
	var roll = keyboard_check_pressed(vk_space);
	if roll{
		if moving{
			var spd = rollSpeed;
			var dir = point_direction(x,y,x+mh,y+mv);
			jumpSet(spd,dir);
			sprite_index = sRolling;
			move = false;
			rollTimer = rollTimerMax;
			baseCollider = false;
			bounceCollider = true;
		}
	}
}
function rollMovement(){
	if rollTimer<1{ exit }
	rollTimer--;
	//LOSE ENERGY PER DURATION OF ROLL
	var amt = (4)/60;
	global.energy=approach(global.energy,0,amt);
	var xDif = sign((x+hsp)-x);
	if xDif!=0{
		image_xscale = xDif;
	}
	var roll = keyboard_check_pressed(vk_space);
	if rollTimer=rollTimerMax-12{
		//TELEGRAPH EFFECT
		if global.energy>=rollEnergyUse{
			var t = animEndPart(sRollTelegraph,4,irandom(359),0,0);
			t.y-=6;
		}else{
			var t = animEndPart(sRollTelegraphLow,4,irandom(359),0,0);
			t.y-=6;
		}
	}
	var endRollEarly = false;
	var coll = instance_place(x+hsp*2,y+vsp*2,oEntity);
	if rollTimer<(rollTimerMax-12){
		if roll{
			endRollEarly = true;
		}
		if coll!=noone{
			var dir = point_direction(x,y-6,x+hsp,y-6+vsp);
			//FORCE HITBOX
			if global.energy>=rollEnergyUse{
				var h = instance_create_depth(x,y-6,depth-1,oMeleeHitbox);
				with(h){
					creator = other;
					sprite_index = other.hitboxSprite;
					image_angle = dir;
					direction = dir;
					damage = other.hitboxDamage;
					knockback = other.hitboxKnockback;
					speed = 4;
					alarm[0] = 6;
				}
			}
			//STOP IF TOO BIG A TARGET
			if (coll.hp-hitboxDamage)>0{
				hsp*=-.5;
				vsp*=-.5;
				move = true;
				sprite_index = sPlayer;
				image_xscale = 1;
				baseCollider = true;
				bounceCollider = false;
			}
			exit;
		}
	}
	if endRollEarly{
		//END ROLL EARLY
		rollTimer = 0;
		var dir = point_direction(x,y-6,x+hsp,y-6+vsp);
		jumpSet(0,0);
		//FORCE HITBOX
		if global.energy>=rollEnergyUse{
			var h = instance_create_depth(x,y-6,depth-1,oMeleeHitbox);
			with(h){
				creator = other;
				sprite_index = other.hitboxSprite;
				image_angle = dir;
				direction = dir;
				damage = other.hitboxDamage;
				knockback = other.hitboxKnockback;
				speed = 4;
				alarm[0] = 6;
			}
		}
	}
	if rollTimer=0{
		move = true;
		sprite_index = sPlayer;
		image_xscale = 1;
		baseCollider = true;
		bounceCollider = false;
	}
}
function basicCollision(_obj=oColl){
	if !baseCollider{ exit }
	
	var hDir = point_direction(x,y,x+hsp,y);
	var vDir = point_direction(x,y,x,y+vsp);
	var amount = deaccel*4;
	
	//HORIZONTAL COLLISION
	if place_meeting(x+hsp,y,_obj){
		jumpApr(0,hDir,amount);
	}else{
		x+=hsp;
	}
	//VERTICAL COLLISION
	if place_meeting(x,y+vsp,_obj){
		jumpApr(0,vDir,amount);
	}else{
		y+=vsp;
	}
	//show_debug_message(string(hsp)+"/"+string(vsp));
}
function bounceCollision(_obj=oColl){
	if !bounceCollider{ exit }
	
	//HORIZONTAL COLLISION
	if place_meeting(x+hsp,y,_obj){
		hsp*=-bounceMulti;
	}else{
		x+=hsp;
	}
	//VERTICAL COLLISION
	if place_meeting(x,y+vsp,_obj){
		vsp*=-bounceMulti;
	}else{
		y+=vsp;
	}
	//show_debug_message(string(hsp)+"/"+string(vsp));
}
function basicProjectile(){
	if !baseCollider or !projActive{ exit }
	var m1 = mouse_check_button(mb_left);
	if alarm[0]<1{
		if m1 and global.energy>=projEnergyUse{
			//FIRE PROJECTILE
			var dir = point_direction(x,y-6,mouse_x,mouse_y);
			var h = instance_create_depth(x,y-6,depth-1,oProjectile);
			with(h){
				creator = other;
				sprite_index = other.projSprite;
				direction = dir;
				image_angle = irandom(359);
				image_index = random(1);
				speed = other.projSpeed;
				damage = other.projDamage;
				alarm[0] = other.projLifetime;
			}
			dir = point_direction(x,y,x+hsp,y+vsp);
			jumpApr(topSpeed/4,dir,deaccel*2);
			global.energy-=projEnergyUse;
			projFiredLast = true;
			alarm[0] = projFireSpd;
		}else{
			if projFiredLast{
				//ENDING BURST? ENDLAG
				alarm[0] = projEndLag;
			}
		}
	}
}
function cameraControl(){
	var tar = camFollowTarget;
	var cam = oGame.cam;
	var camX = camera_get_view_x(cam);
	var camY = camera_get_view_y(cam);
	camX = lerp(camX,tar.x-resWidth/2,camFollowSpeed);
	camY = lerp(camY,tar.y-resHeight/2,camFollowSpeed);
	camera_set_view_pos(cam,camX,camY);
}


