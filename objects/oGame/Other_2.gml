/// @description Setup
randomize();

enum resource{
	key,
	gems
}

global.resources = [resource.key,resource.gems];
global.resourceNames = ["KEY","GEMS"];
global.resourceAmounts = [10,0];
global.resourceSprites = [sKey,sGem];


