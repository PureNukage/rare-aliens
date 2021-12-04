if on {
	var xx = 15
	var yy = 15
	draw_set_color(c_white)
		draw_text(xx,yy,string(player.planet_gravity)) yy += 15
		draw_text(xx,yy,"camera_angle: "+string(camera_get_view_angle(app.camera))) yy += 15
		draw_text(xx,yy,"player.image_angle: "+string(player.image_angle))
}