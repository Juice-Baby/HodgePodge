/// @description Charge buildup
//IF PLAYER IN THE FIELD
var p = oPlayer;
if instance_exists(p) and place_meeting(x,y,p){
	image_alpha = approach(image_alpha,1,1/45);
	var dis = 0;
	with(p){
		dis = point_distance(x,y,x+hsp,y+vsp);
	}
	var nrgGain = dis*chargeMulti;
	chargeRate = nrgGain;
	gainEnergy(nrgGain/60);
	
	if !instance_exists(chargeFX){
		chargeFX = timePart(sChargingAreaElectricity,60,0,0,0,0);
		chargeFX.depth = oPlayer.depth-1;
	}else{
		with(chargeFX){
			var per = 2*(alarm[0]/60);
			x = p.x;
			y = p.y-6;
			image_speed = per*(nrgGain/3);
			image_alpha = per*(nrgGain/3);
			size = per*(nrgGain/4);
			image_xscale = size;
			image_yscale = size;
			alarm[0] = 60;
		}
	}
}


