@tool
extends "res://addons/kamran_wali/code_opt_pro/scripts/code_opt_pros/base_plugin.gd"

# Properties from the scene.
var _manual_setup_button: Button

# Properties needed internally.
var _update_managers: Array[COP_UpdateManager]
var _update_objects: Array[Object]
var _nodes_open: Array[Node]
var _node_current: Node
var _index: int
var _is_setup:= false

func _enter_tree():
	super._enter_tree()
	# _manual_setup_button = $MainContainer/ManualSetupContainer/ManualSetupButton

#region Parent class method override
func get_version_lbl_path() -> String:
	return "Version"
#endregion

func update(delta: float) -> void:
	if EDITOR_PLUGIN.get_editor_interface().is_playing_scene(): # Checking if scene is being played
		if !_is_setup: # Condition to do auto setup
			_auto_setup()
			_is_setup = true
	else:
		if _is_setup:
			_is_setup = false

func _on_manual_setup_button_pressed():
	_auto_setup()

## This method does the automation setup.
func _auto_setup() -> void:
	_update_managers.clear() # Clearing any previously stored data
	_update_objects.clear() # Clearing any previously stored data
	_nodes_open.push_back(EDITOR_PLUGIN.get_editor_interface().get_edited_scene_root())

	while !_nodes_open.is_empty(): # Loop for finding all the automated scripts
		_node_current = _nodes_open.pop_front()

		if _node_current.has_method("_is_update_manager"): # Checking if object is update manager
			_update_managers.append(_node_current) # Adding the update manager
		elif _node_current.has_method("_is_update_object"): # Checking if object is update object
			_update_objects.append(_node_current)
		
		_index = 0 
		while _index < _node_current.get_child_count(): # Loop for finding children
			_nodes_open.push_back(_node_current.get_child(_index)) # Adding new child for checking
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
	
	EDITOR_PLUGIN.get_editor_interface().save_scene() # Saving the currently active scene