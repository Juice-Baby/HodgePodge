/// @description Setup
compHealth(9);
compMoveTowards(.08,3/12,3);
compBaseColl(true);
compTargetingRange(,48*4);
compAnimProjectileAttack(sJoshSpit,sJoshSpitting,48*2.5,4,1.5,120,4);

states = ds_list_create();
ds_list_add(states,
//MOVEMENT STATES
joshLogic, animProjAttack,
//COLLISIONS
basicCollision);


