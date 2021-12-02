if instance_exists(planet) with planet {
	//draw_set_color(c_red)
	//draw_circle(x,y,(bbox_right-bbox_left)/2,false)
}

if instance_exists(player) with player {
	//draw_set_color(c_red)
	//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
	
	//	Draw Gravity Arrow
	if planet_current > -1 {
		var Direction = point_direction(x,y, planet_current.x,planet_current.y)
		var length = 10
		var XX = lengthdir_x(length, Direction)
		var YY = lengthdir_y(length, Direction)
		//draw_arrow(x-XX,y-YY, x+XX,y+YY, 50)
	}
	
	//	Draw Side Arrows
	if planet_current > -1 {
		var LeftDirection = image_angle + 180
		var RightDirection = image_angle
		var length = 25
		var XX = lengthdir_x(length, LeftDirection)
		var YY = lengthdir_y(length, LeftDirection)
		//draw_arrow(x,y,x+XX,y+YY, 100)
		var XX = lengthdir_x(length, RightDirection)
		var YY = lengthdir_y(length, RightDirection)
		//draw_arrow(x,y,x+XX,y+YY, 100)
	}
}