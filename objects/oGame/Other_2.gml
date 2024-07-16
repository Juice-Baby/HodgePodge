/// @description Setup
randomize();
window_set_fullscreen(true);

enum resource{
	key,
	gems,
	engine,
	wheel
}

global.resources = [resource.key,resource.gems,resource.engine,resource.wheel];
global.resourceNames = ["KEY","GEMS","ENGINE","WHEEL"];
global.resourceAmounts = [0,0,0,0];
global.resourceSprites = [sKey,sGem,sEngine,sWheel];

global.energyMax = 50;
global.energy = 0;


