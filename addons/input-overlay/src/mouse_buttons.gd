@tool
extends TextureRect


@export var lmb: Texture
@export var rmb: Texture
@export var mmb: Texture
@export var idle: Texture


func _ready():
	texture = idle


func set_mouse_pressed(pressed: bool, tex_name: String = ""):	
	if pressed and tex_name != "":
		texture = self[tex_name]
	else:
		texture = idle
