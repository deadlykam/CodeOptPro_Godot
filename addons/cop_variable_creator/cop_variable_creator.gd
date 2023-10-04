@tool
extends Control

const _RESOURCE_PATH = "res://kamran_wali/codeoptpro_godot/scripts/resources/"

# Properties from the scene.
var _name_txt: LineEdit
var _create_button: CanvasItem
var _category_options: OptionButton
var _action_options: OptionButton

# Properties needed internally.
var _data_folders: Array[String]
var _data_files: Dictionary
var _dir
var _file_name: String
var _temp_array: Array[String]
var _index

func _enter_tree():
	_name_txt = $MainContainer/NameContainer/Name_Txt
	_create_button = $MainContainer/CreateButton
	_category_options = $MainContainer/CategoryContainer/Category_Options
	_action_options = $MainContainer/ActionContainer/Action_Options

	_data_folders = _get_file_names(_RESOURCE_PATH)
	_set_file_data()
	_set_option_button(_category_options, _data_folders)
	# Setting the first files in the action options
	_set_option_button(_action_options, _data_files[0])

func _on_create_button_pressed():
	var res = COP_FixedBoolVar.new()
	res._value = true
	ResourceSaver.save(res, "res://kamran_wali/codeoptpro_godot/variables/" + _name_txt.text + ".tres", 0)
	print("Creating Variable")

func _on_name_txt_text_changed(new_text):
	# Condition for hiding/showing the create button
	if _create_button.visible != _is_validate():
		_create_button.visible = _is_validate()

func _on_category_options_item_selected(index):
	_set_option_button(_action_options, _data_files[index])

## This method validates if to show the create button.
func _is_validate() -> bool:
	return !_name_txt.text.is_empty()

## This method gets an array of all the files in the path
func _get_file_names(path: String) -> Array[String]:
	_dir = DirAccess.open(path)
	_file_name = ""
	_temp_array = []
	
	# Condition to start to retrieve the file names and storing
	# in the temp array.
	if _dir:
		_dir.list_dir_begin()
		_file_name = _dir.get_next()
		while !_file_name.is_empty():
			_temp_array.append(_file_name)
			_file_name = _dir.get_next()
	return _temp_array

## This method sets the option button.
func _set_option_button(optionButton: OptionButton, 
	items: Array[String]) -> void:
	optionButton.clear()
	for _index in items:
		optionButton.add_item(_index)

## This method sets all the file name data.
func _set_file_data() -> void:
	for _index in range(0, _data_folders.size()):
		_data_files[_index] = _get_file_names(_RESOURCE_PATH + _data_folders[_index] + "/")
