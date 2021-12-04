//	Debug toggling
if input.debugToggle {
	on = !on
}

if input.keyArrowUp player.planet_gravity += 0.1
if input.keyArrowDown player.planet_gravity -= 0.1

if input.keyArrowRight camera_set_view_angle(app.camera, camera_get_view_angle(app.camera) + 1)
if input.keyArrowLeft camera_set_view_angle(app.camera, camera_get_view_angle(app.camera) - 1)

if input.keyRestart game_restart()