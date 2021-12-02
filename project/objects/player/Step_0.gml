//	Planet check
if instance_nearest(x,y,planet) > -1 and planet_current == -1 {
	planet_current = instance_nearest(x,y,planet)
}

//	Movement
hspd = (input.keyRight - input.keyLeft) * 3

if hspd != 0 {
	var LeftDirection = image_angle + 180
	var RightDirection = image_angle
	var xx = 0
	var yy = 0 
	
	if hspd > 0 {
		var xx = lengthdir_x(hspd, RightDirection)
		var yy = lengthdir_y(hspd, RightDirection)
	}
	else {	
		var xx = lengthdir_x(hspd*-1, LeftDirection)
		var yy = lengthdir_y(hspd*-1, LeftDirection)
	}
	
	x += xx
	y += yy
}

//	Jump
if input.keyJump and onGround {
	thrust = -10
	onGround = false
}

//	Gravity
if !onGround and planet_current > -1 {
	thrust += planet_gravity
	
	var Direction = point_direction(x,y, planet_current.x,planet_current.y)
	var XX = lengthdir_x(thrust, Direction)
	var YY = lengthdir_y(thrust, Direction)
	var signX = sign(XX)
	var signY = sign(YY)
	
	//debug.log("direction: "+string(Direction))
	//debug.log("signX: "+string(signX))
	//debug.log("signY: "+string(signY))
			
	if !instance_place(x+XX, y+YY, planet) {
		x += XX
		y += YY
	}
	else {
		if !instance_place(x+signX, y+signY, planet) {
			var loop = true
			while loop {
				x += signX
				y += signY
				if instance_place(x+signX,y+signY,planet) loop = false
			}
		}
		onGround = true	
	}
}

if onGround {
	//	Check for planet underneath
	var Direction = point_direction(x,y, planet_current.x,planet_current.y)
	var XX = lengthdir_x(1, Direction)
	var YY = lengthdir_y(1, Direction)
	if !instance_place(x+XX,y+YY,planet) onGround = false
}

//	Mouse Click Drag
if point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom) {
	if mouse_check_button(mb_left) {
		x = mouse_x
		y = mouse_y
	}
}

//	Players angle towards planet center
if planet_current > -1 {
	var Direction = point_direction(planet_current.x,planet_current.y, x,y)
	image_angle = Direction - 90
}