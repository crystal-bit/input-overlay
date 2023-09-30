@tool
extends Control
class_name InputOverlay

@onready var mouse_overlay = %MouseOverlay

var a = false
var s = false
var d = false
var lmb = false
var rmb = false
var mmb = false
var mmscroll = false


# TODO: add support for multiple buttons pressed at the same time.
func handle_events():
	if lmb:
		mouse_overlay.set_mouse_pressed(true, "lmb")
	elif rmb:
		mouse_overlay.set_mouse_pressed(true, "rmb")
	elif mmb:
		mouse_overlay.set_mouse_pressed(true, "mmb")
	else:
		mouse_overlay.set_mouse_pressed(false)


func receive_input(event):
	if event is InputEventMouseButton:
		lmb = event.button_index == MOUSE_BUTTON_LEFT and event.pressed
		rmb = event.button_index == MOUSE_BUTTON_RIGHT and event.pressed
		mmb = (event.button_index in [MOUSE_BUTTON_MIDDLE, MOUSE_BUTTON_WHEEL_DOWN, MOUSE_BUTTON_WHEEL_UP] and event.pressed)
	if event is InputEventKey:
		if event.keycode == KEY_ESCAPE and event.pressed:
			disable() if visible == true else enable()
	handle_events()


func enable():
	show()


func disable():
	hide()
