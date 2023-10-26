@tool
extends Control

# Static properties
static var EDITOR_PLUGIN: EditorPlugin # Storing Editor Plugin, MUST be called from the plugin script.

# Global Properties
var _version: COP_FixedStringVar

# Local Properties
var _version_lbl: Label # For storing the version label

## This method sets the plugin and is ONLY called from the plugin script.
static func set_plugin(editor_plugin: EditorPlugin) -> void:
	EDITOR_PLUGIN = editor_plugin

func _enter_tree() -> void:
	_version = load("res://addons/kamran_wali/code_opt_pro/variables/default_settings/version.tres")
	if !get_version_lbl_path().is_empty(): # Checking if version lable is NOT empty.
		_version_lbl = get_node(get_version_lbl_path()) # Setting the version label.
		_version_lbl.text = _version.get_value()

func _process(delta):
	if EDITOR_PLUGIN: # Condition to call the update() method.
		update(delta)

## This method does all the update logic. It is recommended to use this update() method instead of
## _process() to avoid errors. This method will ONLY be called if the EDITOR_PLUGIN has been provided.
func update(delta: float) -> void:
	pass

## This method gets the root node of the current editing scene.
func get_scene_root_node() -> Node:
	return EDITOR_PLUGIN.get_editor_interface().get_edited_scene_root()

## This method sets the font colour for the control.
func set_control_font_colour(control: Control, colour: Color) -> void:
	control.add_theme_color_override("font_color", colour)

## This method checks if the value provided is int or NOT.
func is_int(value: String) -> bool:
	return value.is_valid_int() && !value.is_empty()

## This method checks if the value provided is float or NOT.
func is_float(value: String) -> bool:
	return value.is_valid_float() && !value.is_empty()

## This method gets the version label path.
func get_version_lbl_path() -> String:
	return ""
