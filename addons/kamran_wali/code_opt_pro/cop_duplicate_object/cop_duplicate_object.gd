@tool
extends Control

# Properties from the scene.
var _object_path_txt: LineEdit
var _target_path_txt: LineEdit
var _num_duplicate: LineEdit

# Properties needed internally.
var _scene_root: Node

func _enter_tree() -> void:
	# Setting up the scene variables
	_object_path_txt = $MainContainer/ObjectContainer/ObjectPath_Txt
	_target_path_txt = $MainContainer/TargetContainer/TargetPath_Txt
	_num_duplicate = $MainContainer/NumberContainer/Input_Number
#	EditorInterface.get_selection


func _on_object_path_txt_text_changed(new_text):
	pass # Replace with function body.


func _on_duplicate_button_pressed():
	var _select = EditorPlugin.get_editor_interface().get_selection()
#	print("Selected Object: " , EditorInterface.get_selection().get_object())
