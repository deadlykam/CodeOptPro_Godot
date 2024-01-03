@tool
#class_name SomeManagerHelper
extends Resource

# Please provide a type for the _manager var for better performance.
## Storing the manager reference. Do NOT set/get this variable directly.
## Use the functions instead otherwise will give error.
var _manager

# Please provide a type for the manager parameter for better performance and
# set the method type to void.
## This method sets the manager.
func set_manager(manager) -> void:
	_manager = manager

# Please provide a type for the manager return type for better performance.
## This method gets the manager.
func get_manager():
	return _manager

## This method checks if the manager has been set or NOT.
## True means has been set, false otherwise, of type bool.
func has_manager() -> bool:
	return _manager != null