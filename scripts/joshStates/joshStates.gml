// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function joshLogic(){
	var p = targetNearestLineOfSightExcluding(x,y,oCreature,oWall,oJosh);
	//IF NO TARGET OR DOING ATTACK
	if !instance_exists(p) or p=noone{
		//IF NOT ATTACKING
		if sprite_index!=attackAnimation{
			//THEN SLOW DOWN
			var dis = point_direction(x,y,x+hsp,y+vsp);
			jumpApr(0,dis,deaccel);
			sprite_index = sJoshIdle;
		}
		//OTHERWISE DO NOTHING/PERFORM ATTACK
		exit;
	}
	var dir = point_direction(x,y,p.x,p.y);
	var dis = distance_to_object(p);
	//ATTACK/MOVING LOGIC
	//IF YOU CAN SEE THEM
	if alarm[0]>1{
		//RUN AWAYYYYY
		jumpApr(topSpeed,dir+180,accel);
	}
	//CHECK THE DISTANCE
	//IF WITHIN ALERT RANGE
	if dis<alertRange and alarm[0]<1{
		//IF WITHIN ATTACK RANGE
		if dis<attackRange{
			//BEGIN ATTACKING
			sprite_index = attackAnimation;
			//LOOK
			var xDif = sign(p.x-x);
			if xDif!=0{
				image_xscale = xDif;
			}
		}else{
			//OTHERWISE, MOVE IN
			jumpApr(topSpeed,dir,accel);
		}
	}else{
		//IF NOT IN RANGE
		//THEN SLOW DOWN
		var dis = point_direction(x,y,x+hsp,y+vsp);
		jumpApr(0,dis,deaccel);
		exit;
	}
}
function animProjAttack(){
	var p = oPlayer;
	if sprite_index!=attackAnimation or !instance_exists(p){ exit }
	if image_index >= image_number-1{
		//LAST FRAME OF ANIMATION
		//SPAWN PROJECTILE
		var dir = point_direction(x,y,p.x,p.y);
		var spd = topSpeed;
		jumpAdd(spd,dir+180);
		var h = instance_create_depth(x,y,depth-1,oProjectile);
		with(h){
			creator = other;
			sprite_index = other.projSprite;
			damage = other.projDamage;
			knockback = other.projKnockback;
			speed = other.projSpeed;
			direction = dir;
			image_angle = dir;
			alarm[0] = other.alertRange/other.projSpeed;
		}
		sprite_index = sJoshIdle;
		image_xscale = 1;
		alarm[0] = projCooldown;
	}
}


