/// @description Setup
compHealth(20);
compMoveTowards(.05,2/16,2);
compBaseColl(true);
compAnimMeleeAttack(sStupidHeadJumpHitbox,sStupidHeadJump,7,3,90,48);

states = ds_list_create();
ds_list_add(states,
//MOVEMENT STATES
stupidHeadLogic, animMeleeAttack,
//COLLISIONS
basicCollision);


