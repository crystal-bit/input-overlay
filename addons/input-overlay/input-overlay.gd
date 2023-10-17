@tool
extends EditorPlugin

var panel: OverlayWidget
var main_screen
var conf = preload("res://addons/input-overlay/input-overlay-config.tres")


func _enter_tree():
	# init
	panel = load("res://addons/input-overlay/overlay-widget/overlay-widget.tscn").instantiate()
	connect("main_screen_changed", on_main_screen_changed)
	main_screen = get_editor_interface().get_editor_main_screen()
	var base_control := get_editor_interface().get_base_control()
	base_control.add_child(panel)
	# layout
	main_screen.resized.connect(update_panel)
	update_panel()

func update_panel():
	scale_widget()
	position_widget()

func position_widget():
	var rect: Rect2 = main_screen.get_global_rect()
	panel.position.x = rect.position.x
	panel.position.y = rect.position.y + rect.size.y - panel.get_rect().size.y
	panel.position.x += conf.margin_left
	panel.position.y -= conf.margin_bottom

func scale_widget():
	var panel_scale = Vector2(conf.scale, conf.scale)
	panel.scale = panel_scale

func on_main_screen_changed(scrn):
	if scrn == "3D" or scrn == "2D":
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

