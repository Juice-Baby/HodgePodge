/// @description Setup
lag = 14;
dropValue = 1;
setup = function(_id){
	dropId = _id;
	sprite_index = global.resourceSprites[_id];
	itemInit(_id);
}
if spawnId!=-1{
	setup(spawnId);
}
compMovement(.05);
compBounceColl(false,.95);

states = ds_list_create();
ds_list_add(states,bounceCollision);


