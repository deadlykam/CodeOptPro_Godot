@tool
class_name COP_UpdateManagerGlobalHelper
extends Resource

## Storing the manager reference. Do NOT set/get this variable directly.
## Use the functions instead otherwise will give error.
var _manager: COP_UpdateManager

## This method sets the manager
func set_manager(manager: COP_UpdateManager) -> void:
	_manager = manager

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