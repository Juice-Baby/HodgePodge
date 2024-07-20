/// @description Setup
compHealth(20);
compMoveTowards(.05,2/16,2);
compRoll(120,4,sPlayerRollHitbox,10,4);
compProjectile(false,60,1,8,10,24,sBeamStart);
compBaseColl(true);
compBounceColl(false,.9);
compCameraFollow(id,.35);

states = ds_list_create();
ds_list_add(states,
//MOVEMENT STATES
playerMovement,rollMovement,
//COLLISIONS
basicCollision,rollCollision,
//PROJECTILES AND MISC
basicProjectile,
//CAMERA
cameraControl);


