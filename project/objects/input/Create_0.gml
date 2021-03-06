mouseLeftPress = mouse_check_button_pressed(mb_left)
mouseLeftRelease = mouse_check_button_released(mb_left)
mouseLeft = mouse_check_button(mb_left)

mouseRightPress = mouse_check_button_pressed(mb_right)
mouseRightRelease = mouse_check_button_released(mb_right)
mouseRight = mouse_check_button(mb_right)

debugToggle = keyboard_check_pressed(vk_control)

keyLeft = keyboard_check(ord("A"))
keyRight = keyboard_check(ord("D"))
keyUp = keyboard_check(ord("W"))
keyDown = keyboard_check(ord("S"))

keyJump = keyboard_check_pressed(vk_space)

keyArrowUp = keyboard_check_pressed(vk_up)
keyArrowDown = keyboard_check_pressed(vk_down)
keyArrowRight = keyboard_check(vk_right)
keyArrowLeft = keyboard_check(vk_left)

keyRestart = keyboard_check_pressed(ord("R"))