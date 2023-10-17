@tool
class_name OverlayWidget
extends PanelContainer

@onready var mouse_overlay = %MouseOverlay

func handle_mouse_events(event):
	mouse_overlay.update_mouse_overlay(event)


func receive_input(event):
	if event is InputEventMouseButton:
		handle_mouse_events(event)


func enable():
	show()


func disable():
	hide()
