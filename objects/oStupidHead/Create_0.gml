/// @description Setup
compHealth(12);
compMoveTowards(.05,2/16,2);
compBaseColl(true);
compTargetingRange(,48*5);
compAnimMeleeAttack(sStupidHeadJumpHitbox,sStupidHeadJump,7,3,90,48);

states = ds_list_create();
ds_list_add(states,
//MOVEMENT STATES
stupidHeadLogic, animMeleeAttack,
//COLLISIONS
basicCollision);

image_blend = make_color_hsv(irandom(255),255/2,255/2);

attack = function(dir){
	sprite_index = attackAnimation;
	dis = point_distance(x,y,x+hsp,y+vsp);
	var spd = topSpeed-dis;
	jumpAdd(spd,dir);
}


