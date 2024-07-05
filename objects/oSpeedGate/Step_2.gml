/// @description Check
var p = oPlayer;
if !instance_exists(p){
	sprite_index = sSpeedGateIdle;
	exit;
}
var coll = true;//place_meeting(x,y,oEntity);
var check = instance_create_depth(x,y,depth,oAnimEnd);
with(check){
	sprite_index = sSpeedGateHitbox;
	coll = place_meeting(x,y,oEntity);
	instance_destroy();
}
var dis = 0;
with(p){
	dis = point_distance(x,y,x+hsp,y+vsp);
}
var thresh = dis>=spdThreshold;
//mask_index = sprite_index;
switch(state){
	case "IDLE":
		if thresh{
			sprite_index = sSpeedGateAnim;
			if update{
				update = false;
				animEndPart(sSpeedGateOpen,0,0,0,0);
			}
			break;
		}
		//IF UNDER SPEED THRESHOLD
		//AND NOT COLLIDING
		//AND NOT IDLE OR SPEED GATE CLOSED, SO MUST BE OPEN
		if !thresh and !coll and 
		!instance_exists(anim){
			//START CLOSING ANIMATION, TURN OFF COLLISION MASK
			sprite_index = sSpeedGateAnim;
			animEndPart(sSpeedGateClose,0,0,0,0);
			//image_index = 0;
		}
		break;
}


