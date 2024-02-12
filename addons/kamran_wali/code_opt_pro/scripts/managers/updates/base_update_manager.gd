@tool
class_name COP_UpdateManager
extends Node

@export_category("Base Update Manager")
@export var _objects: Array[Node]

## Number of objects to update per frame. Min value is 1
@export var _num_update := 1:
	set(p_num_update):
		if _num_update != p_num_update:
			_num_update = 1 if p_num_update < 1 else p_num_update

## This flag enables/disables auto num_update setup. If true
## then num update will be set automatically. If null or false
## then the user needs to give value to the num update.
@export var _is_set_num_update: COP_FixedBoolVar

var _remove_objects: Array[Node]
var _pointer := 0
var _index_update: int
var _time_delta: float
var _actual_num_update: int # This is the actual number of objects to update

func _ready() -> void:
	_validate_num_update() # Validting the actual number of objects to update
	_calculate_time_delta() # Calculating the delta time for the update manager

#region These methods SHOULD NOT BE CALLED BY OTHER SCRIPTS.
## This method updates the update manager and MUST only be called by 
## its children and NO other scripts.
func _update(delta: float) -> void:
	if _remove_objects.size() == 0: # Condition for updating objects
		if  _objects.size() != 0: # Checking if any update objects exists
			if _num_update == 1: # Condition for updating 1 object per frame
				_update_object(delta)
			else: # Condition for updating n objects per frame
				_index_update = 0
				while _index_update < _actual_num_update:
					_update_object(delta)
					_index_update += 1
	else: # Condition for removing objects
		while _remove_objects.size() != 0: # Loop for removing all the requested objects
			_objects.erase(_remove_objects.pop_back()) # Removing from back to help with performance
		
		_validate_num_update() # Validting the actual number of objects to update
		_calculate_time_delta() # Calculating the delta time for the update manager
		_pointer = 0 # Resetting to 0 to make sure no out of bounds exceptions
		_index_update = 0 # Resetting to 0 to make sure no out of bounds exceptions

## This method adds an object to the update manager. THIS SHOULD ONLY BE CALLED BY
## THE AUTOMATION LOGIC AND NO OTHER SCRIPTS!
func _add_object(object: Node) -> void: # TODO: Rename method to _add(object)
		_objects.append(object)

## This method does all the setup for the update manager. THIS SHOULD ONLY BE CALLED
## BY THE AUTOMATION LOGIC AND NO OTHER SCRIPTS!
func _setup() -> void:
	pass

## This method removes all the data from the manager. THIS SHOULD ONLY BE CALLED BY
## THE AUTOMATION LOGIC AND NO OTHER SCRITPS!
func _reset_data() -> void:
	_objects.clear()
#endregion

## This method adds an object to the update manager and can be used during run time.
func add_object(object: Node) -> void:
	_add_object(object)
	_validate_num_update() # Validting the actual number of objects to update
	_calculate_time_delta() # Calculating the delta time for the update manager

## This method removes the given object.
func remove_object(object: Node) -> void:
	if _objects.size() != 0: # Checking if at least 1 object exists
		_remove_objects.append(object)

## This method removes an object using the given index.
func remove_object_index(index: int) -> void:
	if _objects.size() != 0: # Checking if at least 1 object exists
		remove_object(_objects[index]) # Calling to remove the indexth object

## This method checks if the an object has already been added.
## True means added, false otherwise, of type bool.
func has_object(object: Node) -> bool:
	return _objects.has(object)

## This method gets the time delta value for the manager.
func get_time_delta() -> float:
	return _time_delta

## This method gets the process time delta value for the manager.
func get_time_delta_process() -> float:
	return _time_delta * get_process_delta_time()

## This method gets the physics process time delta value for the manager.
func get_time_delta_physics_process() -> float:
	return _time_delta * get_physics_process_delta_time()

## This method gets the number of objects added to the update manager.
func get_size() -> int:
	return _objects.size()

## This method gets the indexth object.
func get_object_index(index: int) -> Node:
	return _objects[index] if index < _objects.size() else null

## This method enables/disables the update manager. True means to enable
## and false means to disable.
func set_enabled(is_enable: bool) -> void:
	pass

## This method checks if the update manager is enabled.
func is_enabled() -> bool:
	return true

## This method updates the active object.
func _update_object(delta: float) -> void:
	if _objects[_pointer].is_active(): # Checking if object is active
		_objects[_pointer].update(delta) # Updating the object
	
	_pointer = 0 if _pointer + 1 >= _objects.size() else _pointer + 1

## This method calculates the time delta for the update manager.
func _calculate_time_delta() -> void:
	_time_delta = float(_objects.size()) / float(_actual_num_update)
	_time_delta = 1.0 if _time_delta <= 1.0 else _time_delta

## This method calculates the actual number of objects to update.
func _validate_num_update() -> void:
	if _validate_is_set_num_update(): # Checking if auto set is activated
		_actual_num_update = _objects.size()
		_num_update = _actual_num_update # Updating the num update as well
	else: # Manual num update setup condition
		_actual_num_update = _objects.size() if _objects.size() <= _num_update else _num_update

## This method validates the _is_set_num_update variable.
func _validate_is_set_num_update() -> bool:
	if _is_set_num_update != null:
		return _is_set_num_update.get_value()
	else:
		return false

## This method always sends true as the script is 
## update_manager. This method is needed for duck
## typing check and SHOULD NOT be OVERRIDDEN!
func _is_update_manager() -> bool:
	return true
