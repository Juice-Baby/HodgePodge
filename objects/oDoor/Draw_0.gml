/// @description Show cost
draw_self();
if paidFor or !inRadius{ exit }
var _x = x+sprite_width/2;
var _y = y+sprite_height/2;
drawAlign(fa_center,fa_center,fInfo);
var c = c_blue;
draw_set_alpha(.25);
draw_rectangle_color(x-buff,y-buff,x+sprite_width+buff,y+sprite_height+buff,c,c,c,c,false);
draw_set_alpha(1);
draw_text(_x,_y,string(doorCost));


