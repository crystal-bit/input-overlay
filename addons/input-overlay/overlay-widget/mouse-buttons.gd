@tool
extends CenterContainer

var button_overlays = {}

@onready var lmb = $LMB
@onready var mmb = $MMB
@onready var rmb = $RMB


func _ready():
	button_overlays = {"lmb": lmb, "mmb": mmb, "rmb": rmb}


func update_mouse_overlay(buttons: Dictionary = {}):
	for button in buttons:
		button_overlays[button].visible = buttons[button]
