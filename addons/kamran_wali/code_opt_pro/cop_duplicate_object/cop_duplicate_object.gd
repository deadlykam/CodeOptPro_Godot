@tool
extends "res://addons/kamran_wali/code_opt_pro/scripts/code_opt_pros/base_plugin.gd"

const _FROM_TSCN = ".tscn"

# Properties from the scene.
var _parent_status_lbl: Label
var _scene_status_lbl: Label
var _num_instantiate: LineEdit
var _instantiate_button: CanvasItem
var _parent_lock_button: CheckButton
var _scene_lock_button: CheckButton

# Properties needed internally.
var _parent_node: Node
var _scene_object: PackedScene
var _temp_object
var _object_instantiate
var _index: int
var _counter: int
var _index_name: int
var _counter_name: int
var _is_parent: bool
var _is_scene: bool
var _is_number: bool

func _enter_tree() -> void:
	# Setting up the scene variables
	_parent_status_lbl = $MainContainer/ParentContainer/ParentStatus
	_scene_status_lbl = $MainContainer/SceneContainer/SceneStatusLabel
	_num_instantiate = $MainContainer/NumberContainer/Input_Number
	_instantiate_button = $MainContainer/InstantiateButton
	_parent_lock_button = $MainContainer/ParentContainer/LockButton
	_scene_lock_button = $MainContainer/SceneContainer/SceneLockButton

func _is_var_init() -> bool:
	return (_parent_status_lbl != null && _scene_lock_button != null && _scene_status_lbl != null 
		&& _num_instantiate != null && _instantiate_button != null && _parent_lock_button != null)

func update(delta: float) -> void:
	if _is_var_init(): # Checking if all the variables are done loading up
		if _is_parent_selected(): # Checking if parent has been selected.
			# Checking if new parent has been selected and if locked button is disabled.
			if _parent_node != _get_selected_parent_node() && !_parent_lock_button.button_pressed:
				_parent_node = _get_selected_parent_node() # Updating the parent.

				if _parent_node != null: # Checking if parent node is NOT null.
					_parent_status_lbl.set_text(_parent_node.name) # Updating the parent status.
					set_control_font_colour(_parent_status_lbl, Color.GREEN)
					_is_parent = true # Parent selected
		else: # Condition for giving error for NOT selecting parent OR too many selection.
			_parent_status_lbl.set_text("Please select a parent Node object.")
			set_control_font_colour(_parent_status_lbl, Color.INDIAN_RED)
			_is_parent = false # Parent NOT selected
		
		if !_scene_lock_button.button_pressed: # Condition for updating the scene object selection
			if _is_filesystem_object_selected(): # Checking if filesystem object has been selected
				_temp_object = _get_selected_filesystem_object() # Getting the selected filesystem object
				
				if _temp_object is PackedScene: # Checking if filesystem object is scene object.
					if _scene_object != _temp_object: # Condition for updating the scene object
						_scene_object = _temp_object # Updating the scene object
						
						if _scene_object != null: # Condition for updating scene object's status
							_scene_status_lbl.set_text(_get_scene_object_name(_scene_object.resource_path))
							set_control_font_colour(_scene_status_lbl, Color.GREEN)
							_is_scene = true # Scene selected
				else: # Condition for NOT selected scene object
					_scene_status_lbl.set_text("Scene object NOT selected.")
					set_control_font_colour(_scene_status_lbl, Color.INDIAN_RED)
					_scene_object = null # Making null so later can select the previous object.
					_is_scene = false # Scene NOT selected
			else: # Condition for filesystem object NOT selected
				_scene_status_lbl.set_text("Please select a scene object from FileSystem.")
				set_control_font_colour(_scene_status_lbl, Color.INDIAN_RED)
				_is_scene = false # Scene NOT selected
		
		if _is_show_button(): # Showing the button.
			_instantiate_button.show()
		else: # Hiding the button.
			_instantiate_button.hide()

func _on_input_number_text_changed(value: String):
	if is_int(value) && value.to_int() > 0:
		set_control_font_colour(_num_instantiate, Color.WHITE)
		_is_number = true
	else:
		set_control_font_colour(_num_instantiate, Color.INDIAN_RED)
		_is_number = false

func _on_duplicate_button_pressed():
#	_counter = _num_duplicate.get_text().to_int() # Getting the counter value.
#
#	for _index in range(0, _counter): # Loop for creating objects.
#		if _is_packedscene_object(): # Condition for duplicating PackedScenes.
#			_object = load(_object_path_txt.get_text())
#			_object_dup = _object.instantiate()
#		else: # Condition for duplicating Scene Nodes.
#			_object = get_scene_root_node().get_node(_object_path_txt.get_text())
#			_object_dup = _object.duplicate()
#
#		_parent_node.add_child(_object_dup, true) # Adding object and making name readable.
#		_object_dup.set_owner(get_scene_root_node()) # Setting the ownership to the correct scene.

	_counter = _num_instantiate.get_text().to_int() if _is_number else 1 # Getting the counter value

	for _index in range(0, _counter): # Loop for creating objects.
		_object_instantiate = _scene_object.instantiate()
		_parent_node.add_child(_object_instantiate, true) # Adding object and making name readable.
		_object_instantiate.set_owner(get_scene_root_node()) # Setting the ownership to the correct scene.	

## This method checks if the a parent object has been selected.
func _is_parent_selected() -> bool:
	return (EDITOR_PLUGIN.get_editor_interface().get_selection().get_selected_nodes().size() != 0
		|| _parent_node != null)

## This method checks if any file system object has been selected.
func _is_filesystem_object_selected() -> bool:
	return (EDITOR_PLUGIN.get_editor_interface().get_selected_paths().size() != 0
		|| _scene_object != null)

## This method gets the selected parent node.
func _get_selected_parent_node() -> Node:
	if EDITOR_PLUGIN.get_editor_interface().get_selection().get_selected_nodes().size() == 0:
		return null
	
	return EDITOR_PLUGIN.get_editor_interface().get_selection().get_selected_nodes()[0]

## This method gets the selected filesystem object.
func _get_selected_filesystem_object():
	if (EDITOR_PLUGIN.get_editor_interface().get_selected_paths().size() != 0 &&
		EDITOR_PLUGIN.get_editor_interface().get_selected_paths()[0].substr(
			EDITOR_PLUGIN.get_editor_interface().get_selected_paths()[0].length() - _FROM_TSCN.length(), 
			_FROM_TSCN.length()).contains(_FROM_TSCN)):
			return load(EDITOR_PLUGIN.get_editor_interface().get_selected_paths()[0])
	return null

## This method checks if the given object exists.
func _is_object_exist(path: String) -> bool:
	return FileAccess.file_exists(path) || EDITOR_PLUGIN.get_editor_interface().get_edited_scene_root().has_node(path)

## This method checks if to show the button.
func _is_show_button() -> bool:
	return _is_parent && _is_scene

## This method gets the name of the scene object.
func _get_scene_object_name(name: String) -> String:
	for _counter_name in range(name.length() - 1, -1, -1): # Loop for finding the name
		if name[_counter_name] == "/": # Condition for breaking the loop
			_index_name = _counter_name + 1 # Start index of the sub-string
			break
	return name.substr(_index_name, name.length()) # Returning the actual name sub-string
