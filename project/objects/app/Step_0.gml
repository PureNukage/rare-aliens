#region		Camera Logic

if cameraRefresh {
	cameraFix()
	cameraRefresh = false
}

zoom_level = clamp((zoom_level + (mouse_wheel_down()-mouse_wheel_up())*0.1),0.25,2.0)

camera_set_view_pos(camera,
		clamp( camera_get_view_x(camera), 0, room_width - camera_get_view_width(camera) ),
		clamp( camera_get_view_y(camera), 0, room_height - camera_get_view_height(camera) ));

var view_w = camera_get_view_width(camera)
var view_h = camera_get_view_height(camera)

var rate = 0.2

var new_w = round(lerp(view_w, zoom_level *  default_zoom_width, rate))
var new_h = round(lerp(view_h, zoom_level * default_zoom_height, rate))
			
if new_w & 1 {
	new_w++	
}
if new_h & 1 {
	new_h++	
}

camera_set_view_size(camera, new_w, new_h)

//	Realignment
var shift_x = camera_get_view_x(camera) - (new_w - view_w) * 0.5
var shift_y = camera_get_view_y(camera) - (new_h - view_h) * 0.5

camera_set_view_pos(camera,shift_x, shift_y)


////	Clamp app x,y within room
var edgeX = camera_get_view_width(camera)/2
var edgeY = camera_get_view_height(camera)/2
x = clamp(x,0+edgeX,room_width-edgeX)
y = clamp(y,0+edgeY,room_height-edgeY)

if instance_exists(player) {
	x = player.x
	y = player.y
	//if player.onGround {
		var angle = player.image_angle
		if player.image_angle >= 180 and player.image_angle < 360 {
			angle = 360 - player.image_angle
		} else if player.image_angle < 180 {
			angle = 360 - player.image_angle
		} else if player.image_angle > 360 {
			angle = 360 - player.image_angle
		}
		var Direction = point_direction(player.x,player.y, player.planet_current.x,player.planet_current.y)
		var current_angle = camera_get_view_angle(camera)
		var new_angle = lerp(current_angle, angle, 0.03)
		if (sign(angle) != sign(current_angle)) {
			new_angle = angle
		}
		camera_set_view_angle(camera, new_angle)
	//}
}

#endregion