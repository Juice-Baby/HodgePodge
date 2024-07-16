/// @description Screen Tint 
drawAlpha = approach(drawAlpha,1,1/(room_speed*1));

draw_set_alpha(.15*drawAlpha);
var c = c_red;
draw_rectangle_color(0,0,resWidth,resHeight,c,c,c,c,false);
draw_set_alpha(1);
drawAlign(fa_center,fa_center);
c = c_white;
draw_text_transformed_color(resWidth/2,resHeight/2,"Press R to restart",
2,2,0,c,c,c,c,drawAlpha);

var r = keyboard_check_pressed(ord("R"));
if r{
	room_restart();
}


