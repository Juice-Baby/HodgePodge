// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function stupidHeadLogic(){
	var p = targetNearest(x,y,oEntity);
	//IF NO PLAYER, DO NOTHING
	if endLag>0{
		endLag--;
		exit;
	}
	if p = noone or sprite_index = attackAnimation{
		if sprite_index!=attackAnimation{
			var dis = point_direction(x,y,x+hsp,y+vsp);
			jumpApr(0,dis,deaccel);
		}
		exit;
	}
	var dir = point_direction(x,y,p.x,p.y);
	var dis = distance_to_object(p);
	//RANGE CHECK
	if dis>attackRange{
		//KEEP MOVING
		sprite_index = sStupidHeadMoving;
		jumpApr(topSpeed,dir,accel);
	}else{
		//ATTACK IF IN RANGE AND OFF COOLDOWN
		if sprite_index!=attackAnimation and alarm[0]<1{
			sprite_index = attackAnimation;
			dis = point_distance(x,y,x+hsp,y+vsp);
			var spd = topSpeed-dis;
			jumpAdd(spd,dir);
		}
	}
}
function animMeleeAttack(){
	if sprite_index!=attackAnimation { exit }
	if image_index >= image_number-1{
		//LAST FRAME OF ANIMATION
		//SPAWN HITBOX
		var dir = point_direction(x,y,x+hsp,y+vsp);
		var dis = point_distance(x,y,x+hsp,y+vsp);
		var spd = min(topSpeed,dis);
		jumpAdd(spd,dir+180);
		var h = instance_create_depth(x,y,depth-1,oMeleeHitbox);
		with(h){
			creator = other;
			sprite_index = other.hitboxSprite;
			damage = other.hitboxDamage;
			knockback = other.hitboxKnockback;
			alarm[0] = 2;
		}
		sprite_index = sStupidHead;
		alarm[0] = attackCooldown;
		endLag = attackCooldown/2;
	}
}


