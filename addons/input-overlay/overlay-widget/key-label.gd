@tool
extends Label

@onready var panel: Panel = get_parent()
@export var keycode: Key


func _ready():
	set_highlight(false)
	set_process(panel != null)
	assert(panel, "Parent panel is required to work")


func set_highlight(highlight: bool):
	if highlight:
		panel.modulate.a = 1.0
		modulate.a = 1.0
	else:
		panel.modulate.a = 0.4
		modulate.a = 0.2


func _process(delta):
	set_highlight(Input.is_key_pressed(keycode))
