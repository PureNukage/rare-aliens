//	Debug toggling
if input.debugToggle {
	on = !on
}

if input.keyArrowUp player.planet_gravity += 0.1
if input.keyArrowDown player.planet_gravity -= 0.1