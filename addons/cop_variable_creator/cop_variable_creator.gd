@tool
extends Control

var _name_txt: LineEdit
var _create_button: CanvasItem

func _enter_tree():
	_name_txt = $MainContainer/NameContainer/Name_Txt
	_create_button = $MainContainer/CreateButton

func _process(delta):
	_create_button.visible = _is_validate()

func _on_create_button_pressed():
	print("Creating Variable")

## This method validates if to show the create button.
func _is_validate() -> bool:
	return !_name_txt.text.is_empty()
