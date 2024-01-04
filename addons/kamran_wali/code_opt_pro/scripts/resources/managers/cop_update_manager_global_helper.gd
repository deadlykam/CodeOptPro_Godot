@tool
class_name COP_UpdateManagerGlobalHelper
extends Resource

## Storing the manager reference. Do NOT set/get this variable directly.
## Use the functions instead otherwise will give error.
var _manager: COP_UpdateManager

## This method sets the manager.
func set_manager(manager: COP_UpdateManager) -> void:
	_manager = manager

## This method gets the manager.
func get_manager() -> COP_UpdateManager:
	return _manager

## This method checks if the manager has been set or NOT.
## True means has been set, false otherwise, of type bool.
func has_manager() -> bool:
	return _manager != null