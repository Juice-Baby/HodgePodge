/// @description FULLSCREEN
var f = window_get_fullscreen();
if f{
	window_set_fullscreen(false);
	window_set_size(resWidth*resScale,resHeight*resScale);
}else{
	window_set_fullscreen(true);
}


