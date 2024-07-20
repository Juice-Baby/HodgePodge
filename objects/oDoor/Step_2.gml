/// @description Check
var p = oPlayer;
if !instance_exists(p) or paidFor{ exit }
var coll = point_in_rectangle(
p.x,p.y-6,x-buff,y-buff,x+sprite_width+buff,y+sprite_height+buff);

inRadius = coll;
if coll{
	//IN DETECTION RADIUS
	inRadius = true;
	var e = keyboard_check_pressed(ord("E"));
	var amt = global.resourceAmounts[resource.key];
	if e and amt>=doorCost{
		sprite_index = spr.unlocking;
		paidFor = true;
	}
}


