/// @description Give resource
if lag>1{
	exit;
}
global.resourceAmounts[dropId]+=dropValue;
playerPickedUp(dropId);
instance_destroy();


