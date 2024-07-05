/// @description Switch
update = true;
switch(anim.sprite_index){
	case sSpeedGateClose:
		sprite_index = sSpeedGateIdle;
		break;
}

if anim!=-1 and instance_exists(anim){
	instance_destroy(anim);
}


