@tool
extends "res://addons/kamran_wali/code_opt_pro/scripts/code_opt_pros/base_plugin.gd"

# Properties from the scene.
var _auto_save_current_scene_button: CheckButton
var _log_label: Label

# Properties needed internally.
var _update_managers: Array[COP_UpdateManager]
var _update_objects: Array[Node]
var _auto_setup_objects: Array[Node]
var _nodes_open: Array[Node]
var _node_current: Node
var _index: int
var _is_setup:= false
var _log_counter:= 0

func _enter_tree():
	super._enter_tree()
	_auto_save_current_scene_button = $SettingHolder/AutoSaveCurrentSceneButton
	_log_label = $LogHolder/LogLabel

#region Parent class method override
func get_version_lbl_path() -> String:
	return "Version"
#endregion

## This method does the automation setup.
func _auto_setup() -> void:
	_log_counter = 0
	_log_label.text = "Log:"
	_write_to_log("Initializing Auto Setup...")
	_update_managers.clear() # Clearing any previously stored data
	_update_objects.clear() # Clearing any previously stored data
	_auto_setup_objects.clear() # Clearing any previously stored data
	_nodes_open.push_back(EDITOR_PLUGIN.get_editor_interface().get_edited_scene_root())

	while !_nodes_open.is_empty(): # Loop for finding all the automated scripts
		_node_current = _nodes_open.pop_front()

		if _node_current.has_method("_is_update_manager"): # Checking if object is update manager
			_update_managers.append(_node_current) # Adding the update manager
		if _node_current.has_method("_is_update_object"): # Checking if object is update object
			_update_objects.append(_node_current) # Adding the update object
		if _node_current.has_method("_is_auto_setup_object"): # Checking if object is auto setup object
			_auto_setup_objects.append(_node_current) # Adding the auto setup object
		
		_index = 0 
		while _index < _node_current.get_child_count(): # Loop for finding children
			_nodes_open.push_back(_node_current.get_child(_index)) # Adding a new child for checking
			_index += 1

	_index = 0
	while _index < _update_managers.size(): # Loop for setting update managers.
		_update_managers[_index]._setup() # Setting up the update manager
		_update_managers[_index]._reset_data() # Resetting the objects in the update manager
		_index += 1

	_index = 0
	while _index < _update_objects.size(): # Loop for setting update objects.
		if _update_objects[_index].has_method("_add_self_to_manager"):
			_update_objects[_index]._add_self_to_manager() # Adding update object to correct update manager
		_index += 1
	
	_index = 0
	while _index < _auto_setup_objects.size(): # Loop for setting auto setup objects.
		if _auto_setup_objects[_index].has_method("auto_setup"):
			_auto_setup_objects[_index].auto_setup() # Calling the auto setup method
		_index += 1
	
	_write_to_log("Auto Setup Done!")

	if _auto_save_current_scene_button.button_pressed: # Condition for saving current active scene
		if !EDITOR_PLUGIN.get_editor_interface().save_scene(): # Saving the currently active scene
			_write_to_log("Saved Current Scene.")
		else:
			_write_to_log("Error: Failed To Save Current Scene!") # Showing failed save message

## This method does the auto setup and then plays the main scene.
func _on_run_project_button_pressed():
	_auto_setup()
	_write_to_log("Starting Main Scene.")
	EDITOR_PLUGIN.get_editor_interface().play_main_scene()

## This method does the auto setup and then plys the current scene.
func _on_run_current_scene_button_pressed():
	_auto_setup()
	_write_to_log("Starting Current Scene")
	EDITOR_PLUGIN.get_editor_interface().play_current_scene()

## This method does the auto setup only.
func _on_manual_setup_button_pressed():
	_auto_setup()

## This method appends a new log message.
func _write_to_log(log: String) -> void:
	_log_counter += 1
	_log_label.text = _log_label.text + "\n" + str(_log_counter) + ". " + log
