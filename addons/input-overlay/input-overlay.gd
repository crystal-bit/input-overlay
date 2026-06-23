@tool
extends EditorPlugin

var panel: OverlayWidget
var main_screen

const PREFIX = "addons/input-overlay/"
const SETTING_HM = PREFIX + "horizontal_margin"
const SETTING_VM = PREFIX + "vertical_margin"
const SETTING_SCALE = PREFIX + "scale"
const SETTING_ANCHOR = PREFIX + "anchor"

enum Anchors { TOP_LEFT, TOP_RIGHT, BOTTOM_LEFT, BOTTOM_RIGHT }

const _DEFAULTS := {
	SETTING_HM: 32,
	SETTING_VM: 32,
	SETTING_SCALE: 1.0,
	SETTING_ANCHOR: Anchors.BOTTOM_LEFT,
}

func _enter_tree():
	_setup_settings()
	panel = load("res://addons/input-overlay/overlay-widget/overlay-widget.tscn").instantiate()
	connect("main_screen_changed", on_main_screen_changed)
	main_screen = get_editor_interface().get_editor_main_screen()
	var base_control := get_editor_interface().get_base_control()
	base_control.add_child(panel)
	main_screen.resized.connect(update_panel)
	ProjectSettings.settings_changed.connect(update_panel)
	update_panel()


func _setup_settings():
	var dirty = false
	for key in _DEFAULTS:
		if not ProjectSettings.has_setting(key):
			ProjectSettings.set_setting(key, _DEFAULTS[key])
			dirty = true
		ProjectSettings.set_initial_value(key, _DEFAULTS[key])

	ProjectSettings.add_property_info({
		"name": SETTING_HM, "type": TYPE_INT, "hint": PROPERTY_HINT_RANGE,
		"hint_string": "0,1024,1"
	})
	ProjectSettings.add_property_info({
		"name": SETTING_VM, "type": TYPE_INT, "hint": PROPERTY_HINT_RANGE,
		"hint_string": "0,1024,1"
	})
	ProjectSettings.add_property_info({
		"name": SETTING_SCALE, "type": TYPE_FLOAT, "hint": PROPERTY_HINT_RANGE,
		"hint_string": "0.5,2.0,0.1"
	})
	ProjectSettings.add_property_info({
		"name": SETTING_ANCHOR, "type": TYPE_INT,
		"hint": PROPERTY_HINT_ENUM,
		"hint_string": "Top-Left,Top-Right,Bottom-Left,Bottom-Right"
	})

	if dirty:
		ProjectSettings.save()


func update_panel():
	scale_widget()
	position_widget()


func position_widget():
	var rect = main_screen.get_global_rect()
	var x = 0
	var y = 0
	panel.position = rect.position

	var anchor = ProjectSettings.get_setting(SETTING_ANCHOR)
	var hm = ProjectSettings.get_setting(SETTING_HM)
	var vm = ProjectSettings.get_setting(SETTING_VM)

	if anchor & 1:
		x += rect.size.x - panel.get_rect().size.x - hm
	else:
		x += hm

	if anchor >> 1:
		y += rect.size.y - panel.get_rect().size.y - vm
	else:
		var toolbar_height = 32
		y += vm + toolbar_height

	panel.position.x += x
	panel.position.y += y


func scale_widget():
	panel.scale = Vector2.ONE * ProjectSettings.get_setting(SETTING_SCALE)


func on_main_screen_changed(scrn):
	if scrn == "3D" or scrn == "2D":
		panel.enable()
	else:
		panel.disable()


func _exit_tree():
	ProjectSettings.settings_changed.disconnect(update_panel)
	var base_control := get_editor_interface().get_base_control()
	base_control.remove_child(panel)
	panel = null


func _input(event):
	if panel:
		panel.receive_input(event)
