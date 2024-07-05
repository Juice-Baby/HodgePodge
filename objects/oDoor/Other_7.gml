/// @description DESTROY
switch(sprite_index){
	case spr.unlocking:
		global.resourceAmounts[resource.key]-=doorCost;
		instance_destroy();
		break;
}


