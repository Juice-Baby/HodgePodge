/// @description HUD
drawAlign(fa_left,fa_top,fInfo);
draw_text(4,4,string(hp)+"/"+string(hpMax));

drawAlign(fa_right,fa_bottom,fInfo);
var i = 0;
var s = array_length(global.resources);
var _x = resWidth-4;
var _y = resHeight-4;
var offset = 16;
repeat(s){
	_y = resHeight-4-(offset*(s-(i-1)));
	var re = global.resources[i];
	var name = global.resourceNames[re];
	var amt = global.resourceAmounts[re];
	draw_text(_x,_y,name+": "+string(amt));
	i++;
}


