@tool
class_name COP_UpdateManagerGlobalHelper
extends Resource

## Storing the manager reference. Do NOT set/get this variable directly.
## Use the functions instead otherwise will give error.
var _manager: COP_UpdateManager

## This method sets the manager.
func set_manager(manager: COP_UpdateManager) -> void:
	_manager = manager

## This method checks if the given manager is same as the set manager
## or not.
func is_manager(manager: COP_UpdateManager) -> bool:
	return _manager == manager

## This method adds an object to the manager. THIS SHOULD ONLY BE CALLED BY
## THE AUTOMATION LOGIC AND NO OTHER SCRIPTS!
func add_object(object) -> void:
	if _manager:
		_manager.add_object(object)

## This method checks if the an object has already been added.
## True means added, false otherwise, of type bool.
func has_object(object) -> bool:
	return false if !_manager else _manager.has_object(object)

## This method gets the time delta value for the manager.
func get_time_delta() -> float:
	return -1.0 if !_manager else _manager.get_time_delta()

## This method gets the process time delta value for the manager.
func get_time_delta_process() -> float:
	return -1.0 if !_manager else _manager.get_time_delta_process()

## This method gets the physics process time delta value for the manager.
func get_time_delta_physics_process() -> float:
	return -1.0 if !_manager else _manager.get_time_delta_physics_process()

## This method always sends true as the script is 
## update_manager. This method is needed for duck
## typing check and SHOULD NOT be OVERRIDDEN!
func is_update_manager() -> bool:
	return false if !_manager else _manager.is_update_manager()