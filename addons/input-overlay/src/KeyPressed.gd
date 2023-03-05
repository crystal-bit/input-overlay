@tool
extends Label

@export var key: String : set = _set_key
@onready var panel: Panel = get_parent() 


func _ready():
	panel.modulate.a = 0.4
	modulate.a = 0.2

	
func _set_key(v: String):
	if len(v) == 1:
		key = v.to_upper()
	else:
		key = v
	text = key
	
	
func _input(event):
	if !panel:
		return
	if event is InputEventKey:
		if event.as_text_key_label() == key:
			if event.pressed:
				panel.modulate.a = 1.0
				modulate.a = 1.0
			else:
				panel.modulate.a = 0.4
				modulate.a = 0.2
