// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function executeStates(_states=-1){
	if _states=-1{ exit }
	var ls = _states;
	var s = ds_list_size(ls);
	var i = 0;
	repeat(s){
		var scr = ds_list_find_value(ls,i);
		script_execute(scr);
		i++;
	}
}
function compHealth(_hpMax=10){
	hp = _hpMax;
	hpMax = _hpMax;
}
function compMovement(_deaccel=.25){
	move = true;
	hsp = 0;
	vsp = 0;
	deaccel = _deaccel;
}
function compBaseColl(_bool=true){
	baseCollider = _bool;
}
function compBounceColl(_bool=false,_bounce=.75){
	bounceCollider = _bool;
	bounceMulti = _bounce;
}
function compMoveTowards(_deaccel=.25,_accel=.25,_topSpeed=2){
	compTargeting();
	accel = _accel;
	topSpeed = _topSpeed;
	compMovement(_deaccel);
}
function compRoll(_rollTimerMax=90,_rollSpeed=4,_spr,_dmg=10,_kb=1){
	rollTimer = 0;
	rollTimerMax = _rollTimerMax;
	rollSpeed = _rollSpeed;
	hitboxSprite = _spr;
	hitboxDamage = _dmg;
	hitboxKnockback = _kb;
}
function compTargeting(){
	target = noone;
}
function compCameraFollow(_follow=id,_spd=.35){
	cam = view_camera[0];
	camFollowTarget = _follow;
	camFollowSpeed = _spd;
}
function compAnimMeleeAttack(_spr,_anim,_dmg=10,_kb=1,_time=120,_range=48){
	hitboxSprite = _spr;
	attackAnimation = _anim;
	hitboxDamage = _dmg;
	hitboxKnockback = _kb;
	attackCooldown = _time;
	attackRange = _range;
	endLag = 0;
}
function compProjectile(_active=true,_lag=60,_dmg=1,_spd=8,_firespd=12,_lifetime=15,_spr){
	projActive = _active;
	projFiredLast = false;
	projEndLag = _lag;
	projDamage = _dmg;
	projSpeed = _spd;
	projFireSpd = _firespd;
	projLifetime = _lifetime;
	projSprite = _spr;
}


