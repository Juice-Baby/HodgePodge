/// @description Check
var p = oPlayer;
var coll = true;
var check = instance_create_depth(x,y,depth,oAnimEnd);
with(check){
	sprite_index = sSpeedGateHitbox;
	coll = place_meeting(x,y,oEntity);
	instance_destroy();
}
if !instance_exists(p){
	if !coll and (speedGateObj = -1 or !instance_exists(speedGateObj)){
		speedGateObj = instance_create_depth(x,y,depth,oWall);
		with(speedGateObj){
			sprite_index = other.speedGateSpr;
			image_blend = other.image_blend;
		}
	}
	exit;
}
var dis = 0;
with(p){
	dis = point_distance(x,y,x+hsp,y+vsp);
}
var thresh = dis>spdThreshold;
if !thresh{
	if !coll and !instance_exists(speedGateObj){
		speedGateObj = instance_create_depth(x,y,depth,oWall);
		with(speedGateObj){
			sprite_index = other.speedGateSpr;
			image_blend = other.image_blend;
		}
	}
}else{
	if instance_exists(speedGateObj){
		instance_destroy(speedGateObj);
	}
}


