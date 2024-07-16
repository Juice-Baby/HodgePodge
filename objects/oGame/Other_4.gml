/// @description Setup
if instance_exists(oSpawnpoint){
	#macro resWidth 480
	#macro resHeight 360
	#macro resScale 2

	//ENABLE VIEWS
	view_enabled = true;
	view_visible[0] = true;

	//CREATING CAMERA
	cam = camera_create_view(0,0,resWidth,resHeight);
	view_set_camera(0,cam);

	//WINDOW AND APPLICATION SURFACE
	window_set_size(resWidth*resScale,resHeight*resScale);
	surface_resize(application_surface,resWidth*resScale,resHeight*resScale);

	display_set_gui_size(resWidth,resHeight);

	camX = 0;
	camY = 0;
	//mousePrevX = device_mouse_x_to_gui(0);
	//mousePrevY = device_mouse_y_to_gui(0);

	//CENTERING WINDOW
	var disWidth = display_get_width();
	var disHeight = display_get_height();

	var winWidth = resWidth*resScale;
	var winHeight = resHeight*resScale;

	window_set_position(disWidth/2-winWidth/2,disHeight/2-winHeight/2);

	//PLAYER STUFF
	if instance_exists(oSpawnpoint){
		var sp = oSpawnpoint;
		camX = sp.x;
		camY = sp.y;
		//camXToReach = room_width/4;
		//camYToReach = room_height/4;

		with(sp){
			instance_create_depth(x,y,50,oPlayer);
		}
	}
}


