@tool
extends EditorPlugin

var panel: InputOverlay


func _enter_tree():
	panel = load("res://addons/input-overlay/src/main.tscn").instantiate()
	connect("main_screen_changed", on_main_screen_changed)
	var base_control := get_editor_interface().get_base_control()
	base_control.add_child(panel)


func on_main_screen_changed(scrn):
	if scrn == "3D":
		panel.enable()
	else:
		panel.disable()
	

func _exit_tree():
	var base_control := get_editor_interface().get_base_control()
	base_control.remove_child(panel)
	panel = null


func _input(event):
	if panel:
		panel.receive_input(event)
	
