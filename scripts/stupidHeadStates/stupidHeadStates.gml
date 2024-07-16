// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function stupidHeadLogic(){
	var p = oPlayer;//targetNearest(x,y,oCreature);
	//IF NO PLAYER, DO NOTHING
	if endLag>0{
		endLag--;
		exit;
	}
	//IF NO TARGET OR DOING ATTACK
	if p = noone or sprite_index = attackAnimation{
		//IF NOT ATTACKING
		if sprite_index!=attackAnimation{
			//THEN SLOW DOWN
			var dis = point_direction(x,y,x+hsp,y+vsp);
			jumpApr(0,dis,deaccel);
		}
		//OTHERWISE DO NOTHING/PERFORM ATTACK
		exit;
	}
	var lineOfSight = collision_line(x,y-6,p.x,p.y,oWall,false,true);
	var dir = point_direction(x,y,p.x,p.y);
	var dis = distance_to_object(p);
	//ATTACK/MOVING LOGIC
	//IF YOU CAN SEE THEM
	if lineOfSight=noone{
		//CHECK THE DISTANCE
		//IF WITHIN ALERT RANGE
		if dis<alertRange{
			//IF WITHIN ATTACK RANGE
			if dis<attackRange{
				//BEGIN ATTACKING
				sprite_index = attackAnimation;
				dis = point_distance(x,y,x+hsp,y+vsp);
				var spd = topSpeed-dis;
				jumpAdd(spd,dir);
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
	//IF NOT IN RANGE OR IN LINE OF SIGHT, SLOW DOWN ANYWAY
	var dis = point_direction(x,y,x+hsp,y+vsp);
	jumpApr(0,dis,deaccel);
	exit;
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


