@tool
extends EditorPlugin

var panel: InputOverlay


func _enter_tree():
	panel = load("res://addons/input-overlay/src/main.tscn").instantiate()
	var base_control := get_editor_interface().get_base_control()
	base_control.add_child(panel)


func _exit_tree():
	var base_control := get_editor_interface().get_base_control()
	base_control.remove_child(panel)
	panel = null


func _input(event):
	if panel:
		panel.receive_input(event)
	
