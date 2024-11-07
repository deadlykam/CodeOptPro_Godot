@tool
extends "res://addons/kamran_wali/code_opt_pro/scripts/code_opt_pros/base_plugin.gd"

const _RESOURCE_PATH = "res://addons/kamran_wali/code_opt_pro/scripts/resources/"
const _DEFAULT_VAR_TYPE_PATH = "res://addons/kamran_wali/code_opt_pro/variables/"
const _FIXED_VARS = "fixed_vars"
const _FIXED_BOOL = "fixed_bool"
const _FIXED_FLOAT = "fixed_float"
const _FIXED_INT = "fixed_int"
const _FIXED_STRING = "fixed_string"
const _FIXED_VECTOR2 = "fixed_vector2"
const _FIXED_VECTOR3 = "fixed_vector3"
const _SETTINGS = "settings"

# Path Properties
var _paths: Array[COP_VariablePaths]
var _c_paths:= 0

# Properties from the scene.
var _name_txt: LineEdit
var _path_txt: LineEdit
var _create_button: CanvasItem
var _category_options: OptionButton
var _action_options: OptionButton
var _input_container: HBoxContainer
var _input_bool: CheckBox
var _input_txt: TextEdit
var _vector2_input_holder: HBoxContainer
var _input_vec2_x: TextEdit
var _input_vec2_y: TextEdit
var _vector3_input_holder: HBoxContainer
var _input_vec3_x: TextEdit
var _input_vec3_y: TextEdit
var _input_vec3_z: TextEdit

# Properties needed internally.
var _data_folders: Array[String]
var _data_files: Dictionary
var _data_inputs: Array[CanvasItem]
var _dir
var _file_name: String
var _temp_array: Array[String]
var _index_category: int
var _index_actions: int
var _index_path: int
var _index
var _index_input
var _temp_vec2: Vector2
var _temp_vec3: Vector3

func _enter_tree():
	super._enter_tree()
	
	# Setting up the paths, append a new variable path here and make sure they are in alphabetical order
	# NOTE: If the new variable does NOT require input then by just appending them here will do the job.
	#		No need to change any code to make it work. Made the code dynamic for adding a new type.
	_paths.clear() # Clearing any previous data
	_paths.append(load("res://addons/kamran_wali/code_opt_pro/variables/default_settings/path_fixed_vars.tres")) # Fixed Vars Path
	_paths.append(load("res://addons/kamran_wali/code_opt_pro/variables/default_settings/path_managers.tres")) # Managers Path
	_paths.append(load("res://addons/kamran_wali/code_opt_pro/variables/default_settings/path_observers.tres")) # Observers Path
	_paths.append(load("res://addons/kamran_wali/code_opt_pro/variables/default_settings/path_vars.tres")) # Vars Path
	
	# Setting up the scene variables
	_name_txt = $MainContainer/NameContainer/Name_Txt
	_path_txt = $MainContainer/PathContainer/Path_Txt
	_create_button = $MainContainer/CreateButton
	_category_options = $MainContainer/CategoryContainer/Category_Options
	_action_options = $MainContainer/ActionContainer/Action_Options
	_input_container = $MainContainer/InputContainer
	_input_bool = $MainContainer/InputContainer/Input_Bool
	_input_txt = $MainContainer/InputContainer/Input_Txt
	_vector2_input_holder = $MainContainer/InputContainer/Vector2_Input_Holder
	_input_vec2_x = $MainContainer/InputContainer/Vector2_Input_Holder/Input_Vec2_X
	_input_vec2_y = $MainContainer/InputContainer/Vector2_Input_Holder/Input_Vec2_Y
	_vector3_input_holder = $MainContainer/InputContainer/Vector3_Input_Holder
	_input_vec3_x = $MainContainer/InputContainer/Vector3_Input_Holder/Input_Vec3_X
	_input_vec3_y = $MainContainer/InputContainer/Vector3_Input_Holder/Input_Vec3_Y
	_input_vec3_z = $MainContainer/InputContainer/Vector3_Input_Holder/Input_Vec3_Z
	
	# Setting up the scene at start #
	_set_data_inputs() # Setting the data inputs
	_input_container.hide()
	_data_folders = _get_file_names(_RESOURCE_PATH)
	_data_folders.erase(_SETTINGS) # Removing the settings folder
	_set_file_data()
	_check_paths() # Checking path size and updating to correct paths
	_set_option_button(_category_options, _data_folders, true, false)
	_set_option_button(_action_options, _data_files[0], true, true) # Setting the first files in the action options
	_index_category = 0 # Storing the first category selected
	_index_actions = 0 # Storing the first action type selected
	_set_inputs() # Showing the correct input at start
	_update_path_txt() # Showing the correct path at start
	_update_create_button_name() # Updating the button name at start

func update(delta: float) -> void:
	if _create_button.visible != _is_show_create_button():
		_create_button.visible = _is_show_create_button()

func get_version_lbl_path() -> String:
	return "Version"

func _on_create_button_pressed():
	var variable = load(_RESOURCE_PATH + "/" + _data_folders[_index_category] + "/" 
		+ _data_files[_index_category][_index_actions]).new()
	
	# Condition for setting the values of the fixed variables
	if _is_fixed_vars():
		if _is_fixed_bool():
			_set_fixed_var_value(variable, _input_bool.button_pressed)
		if _is_fixed_float():
			_set_fixed_var_value(variable, _input_txt.text.to_float())
		if _is_fixed_int():
			_set_fixed_var_value(variable, _input_txt.text.to_int())
		if _is_fixed_string():
			_set_fixed_var_value(variable, _input_txt.text)
		if _is_fixed_vector2():
			_temp_vec2.x = _input_vec2_x.text.to_float()
			_temp_vec2.y = _input_vec2_y.text.to_float()
			_set_fixed_var_value(variable, _temp_vec2)
		if _is_fixed_vector3():
			_temp_vec3.x = _input_vec3_x.text.to_float()
			_temp_vec3.y = _input_vec3_y.text.to_float()
			_temp_vec3.z = _input_vec3_z.text.to_float()
			_set_fixed_var_value(variable, _temp_vec3)
	
	ResourceSaver.save(variable, _get_path_variable() + _name_txt.text + ".tres", 0)
	_clear_all_inputs() # Clearing all the input fields

func _on_path_update_button_pressed():
	_update_path()

func _on_path_txt_text_submitted(new_text):
	_update_path()

func _on_category_options_item_selected(index):
	_index_category = index # Setting the current category selected.
	_index_actions = 0 # Resetting the action index as its options gets resetted as well.
	_set_option_button(_action_options, _data_files[index], true, true)
	_set_inputs()
	_update_path_txt()
	_update_create_button_name()

func _on_action_options_item_selected(index):
	_index_actions = index # Setting the current action type selected.
	_set_inputs()
	_set_input_txt_colour()
	_update_path_txt()
	_update_create_button_name()

func _on_input_txt_text_changed():
	_set_input_txt_colour()

func _on_input_vec_2_x_text_changed():
	_set_input_vec2_x_colour()

func _on_input_vec_2_y_text_changed():
	_set_input_vec2_y_colour()

func _on_input_vec_3_x_text_changed():
	_set_input_vec3_x_colour()

func _on_input_vec_3_y_text_changed():
	_set_input_vec3_y_colour()

func _on_input_vec_3_z_text_changed():
	_set_input_vec3_z_colour()

## This method gets an array of all the files in the path
func _get_file_names(path: String) -> Array[String]:
	_dir = DirAccess.open(path)
	_file_name = ""
	_temp_array = []
	
	# Condition to start to retrieve the file names and storing in the temp array.
	if _dir:
		_dir.list_dir_begin()
		_file_name = _dir.get_next()
		while !_file_name.is_empty():
			_temp_array.append(_file_name)
			_file_name = _dir.get_next()
	return _temp_array

## This method sets the option button.
func _set_option_button(optionButton: OptionButton, 
	items: Array[String], is_modify: bool, is_type: bool) -> void:
	optionButton.clear()
	for _index in items:
		if !is_modify:
			optionButton.add_item(_index)
		else:
			if !is_type:
				optionButton.add_item(_index.replace("_", " ").to_pascal_case())
			else:
				optionButton.add_item(_index.erase(_index.length() - 3, _index.length())
					.erase(0, 3).replace("_", " ").to_pascal_case())

## This method sets all the file name data.
func _set_file_data() -> void:
	for _index in range(0, _data_folders.size()):
		_data_files[_index] = _get_file_names(_RESOURCE_PATH + _data_folders[_index] + "/")

## This method checks if the number of paths and variables are same. If NOT then will update the 
## paths to hold more paths.
func _check_paths() -> void:
	_c_paths = 0
	while _c_paths < _paths.size(): # Loop to check if the number of paths and variables are same
		if _data_files[_c_paths].size() != _paths[_c_paths].get_size():
			_set_path_to_default(_paths[_c_paths], _data_files[_c_paths].size())
		_c_paths += 1


## This method updates the size of the given path and changes all the path
## location to default.
func _set_path_to_default(path: COP_VariablePaths, size: int) -> void:
	path.set_new_path_size(size) # Updating the size of the path.
	for _index_path in range(0, size): # Loop for changing location to default.
		path.update_var_path(_index_path, _DEFAULT_VAR_TYPE_PATH)

## This method sets the proper input.
func _set_inputs() -> void:
	if _is_fixed_vars():
		if _is_fixed_bool():
			_set_inputs_visible(_input_bool, true)
		if _is_fixed_float() || _is_fixed_int() || _is_fixed_string():
			_set_inputs_visible(_input_txt, true)
		if _is_fixed_vector2():
			_set_inputs_visible(_vector2_input_holder, true)
		if _is_fixed_vector3():
			_set_inputs_visible(_vector3_input_holder, true)
	elif _input_container.visible:
		_input_container.hide()

## This method shows the given canvas item and the input container.
func _set_inputs_visible(item: CanvasItem, is_show: bool) -> void:
	# Condition for showing the correct item.
	if is_show:
		# Loop for hidding all the items.
		for _index_actions in _data_inputs:
				_index_actions.visible = false
	
	# Checking if the item is NOT null.
	if item:
		item.visible = is_show
	
	# Condition for showing the input container
	if !_input_container.visible:
		_input_container.show()

## This method checks if the current category is fixed vars.
func _is_fixed_vars() -> bool:
	return _data_folders[_index_category].contains(_FIXED_VARS)

## This method checks if the current action type is fixed bool.
func _is_fixed_bool() -> bool:
	return _data_files[_index_category][_index_actions].contains(_FIXED_BOOL)

## This method checks if the current action type is fixed float.
func _is_fixed_float() -> bool:
	return _data_files[_index_category][_index_actions].contains(_FIXED_FLOAT)

## This method checks if the current action type is fixed int.
func _is_fixed_int() -> bool:
	return _data_files[_index_category][_index_actions].contains(_FIXED_INT)

## This method checks if the current action type is fixed string.
func _is_fixed_string() -> bool:
	return _data_files[_index_category][_index_actions].contains(_FIXED_STRING)

## This method checks if the current action type is fixed vector2.
func _is_fixed_vector2() -> bool:
	return _data_files[_index_category][_index_actions].contains(_FIXED_VECTOR2)

## This method checks if the current action type is fixed vector3.
func _is_fixed_vector3() -> bool:
	return _data_files[_index_category][_index_actions].contains(_FIXED_VECTOR3)

## This method shows the correct colour when the input is valid or invalid.
func _set_input_txt_colour() -> void:
	_set_font_colour(_input_txt, _is_input_txt())

## This method checks if the input_txt's text is correct or NOT.
func _is_input_txt() -> bool:
	return (((_is_fixed_float() && is_float(_input_txt.text)) 
		|| (_is_fixed_int() && is_int(_input_txt.text)) 
		|| _is_fixed_string()) && !_input_txt.text.is_empty())

## This method sets the correct font colour for input vec2 x.
func _set_input_vec2_x_colour() -> void:
	_set_font_colour(_input_vec2_x, _is_input_vec2_x())

## This method checks if the input_vec2_x's text is correct or NOT.
func _is_input_vec2_x() -> bool:
	return is_float(_input_vec2_x.text)

## This method sets the correct font colour for input vec2 y.
func _set_input_vec2_y_colour() -> void:
	_set_font_colour(_input_vec2_y, _is_input_vec2_y())

## This method checks if the input_vec2_y's text is correct or NOT.
func _is_input_vec2_y() -> bool:
	return is_float(_input_vec2_y.text)

## This method sets the correct font colour for input vec3 x.
func _set_input_vec3_x_colour() -> void:
	_set_font_colour(_input_vec3_x, _is_input_vec3_x())

## This method checks if the input_vec3_x's text is correct or NOT.
func _is_input_vec3_x() -> bool:
	return is_float(_input_vec3_x.text)

## This method sets the correct font colour for input vec3 y.
func _set_input_vec3_y_colour() -> void:
	_set_font_colour(_input_vec3_y, _is_input_vec3_y())

## This method checks if the input_vec3_y's text is correct or NOT.
func _is_input_vec3_y() -> bool:
	return is_float(_input_vec3_y.text)

## This method sets the correct font colour for input vec3 z.
func _set_input_vec3_z_colour() -> void:
	_set_font_colour(_input_vec3_z, _is_input_vec3_z())

## This method checks if the input_vec3_z's text is correct or NOT.
func _is_input_vec3_z() -> bool:
	return is_float(_input_vec3_z.text)

## This method checks if the input txt is correct or NOT.
func _is_input_name_txt() -> bool:
	return !_name_txt.text.is_empty()

func _is_input_path_txt() -> bool:
	return !_path_txt.text.is_empty()

## This method sets the text colour of the given TextEdit.
func _set_font_colour(text_editor: TextEdit, is_white: bool) -> void:
	if is_white:
		set_control_font_colour(text_editor, Color.WHITE)
	else:
		set_control_font_colour(text_editor, Color.RED)

## This method checks if the condition for showing the create button has been fulfilled.
func _is_show_create_button() -> bool:
	return (
		((_is_input_txt() || _is_fixed_bool()
		|| (_is_input_vec2_x() && _is_input_vec2_y() if _is_fixed_vector2() else false)
		|| (_is_input_vec3_x() && _is_input_vec3_y() && _is_input_vec3_z() if _is_fixed_vector3() else false)
		) if _is_fixed_vars() else true)
		&& _is_input_name_txt() && _is_input_path_txt()
		)

## This method sets the value for the fixed variables.
func _set_fixed_var_value(variable, value) -> void:
	variable._value = value

## This method updates the path_txt. This is manual work so make sure to setup the order based
## on how the var folders are ordered.
func _update_path_txt() -> void:
	_path_txt.text = _paths[_index_category].get_var_path(_index_actions)

## This method updates the path.
func _update_path() -> void:
	_paths[_index_category].update_var_path(_index_actions, _path_txt.text)

## This method gets the variable path.
func _get_path_variable() -> String:
	return _paths[_index_category].get_var_path(_index_actions)

## This method updates the button name.
func _update_create_button_name() -> void:
	_create_button.text = "Create " + _action_options.get_item_text(_index_actions)

## This method adds all the inputs and input holders in an array. Any new
## input or input holder MUST be added here.
func _set_data_inputs() -> void:
	_data_inputs.append(_input_bool)
	_data_inputs.append(_input_txt)
	_data_inputs.append(_vector2_input_holder)
	_data_inputs.append(_vector3_input_holder)

## This method clears all the input fields.
func _clear_all_inputs() -> void:
	_name_txt.clear()
	_input_txt.clear()
	_input_vec2_x.clear()
	_input_vec2_y.clear()
	_input_vec3_x.clear()
	_input_vec3_y.clear()
	_input_vec3_z.clear()