@tool
extends CenterContainer

@onready var button_overlays = {
	"lmb" = $LMB,
	"mmb" = $MMB,
	"msd" = $MSD,
	"msu" = $MSU,
	"rmb" = $RMB
}

@onready var scroll_timer = $ScrollTimer



func update_mouse_overlay(event):
	var buttons = _get_buttons(event)
	for button in buttons:
		button_overlays[button].visible = buttons[button]
		if ["msd", "msu"].has(button) and buttons[button]:
			_start_scroll_timer()


func _get_buttons(event):
	var buttons = {"lmb": false, "mmb": false, "rmb": false}
	var button_mask = event.button_mask
	var button_index = event.button_index
	# Scroll events can mess with the state of the buttons
	if (button_index == MOUSE_BUTTON_WHEEL_UP or button_index == MOUSE_BUTTON_WHEEL_DOWN):
		return {
			"msd": button_index == MOUSE_BUTTON_WHEEL_DOWN,
			"msu": button_index == MOUSE_BUTTON_WHEEL_UP
		}
	if event.pressed:
		# When some button is pressed, update the state of all buttons to deal
		# with problems related to the popup menu
		if button_mask & MOUSE_BUTTON_MASK_LEFT == MOUSE_BUTTON_MASK_LEFT:
			buttons["lmb"] = true
		if button_mask & MOUSE_BUTTON_MASK_MIDDLE == MOUSE_BUTTON_MASK_MIDDLE:
			buttons["mmb"] = true
		if button_mask & MOUSE_BUTTON_MASK_RIGHT == MOUSE_BUTTON_MASK_RIGHT:
			buttons["rmb"] = true
	else:
		# For some reason, the event fired on button release only reports the
		# released button
		if button_index == MOUSE_BUTTON_LEFT:
			buttons = { "lmb": false }
		elif button_index == MOUSE_BUTTON_MIDDLE:
			buttons = { "mmb": false }
		elif button_index == MOUSE_BUTTON_RIGHT:
			buttons = { "rmb": false }
	return buttons


func _on_scroll_timer_timeout():
	button_overlays["msd"].visible = false
	button_overlays["msu"].visible = false


func _start_scroll_timer():
	scroll_timer.start(0.2)
