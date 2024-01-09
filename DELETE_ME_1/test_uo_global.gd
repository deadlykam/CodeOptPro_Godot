@tool
extends Node # You may change the extension as you wish but the methods
#              here MUST remain for this object to become an update object

var _counter:= 0
@export var _is_active:= true

## The global update manager that will update this object.
@export var update_manager: COP_UpdateManagerGlobalHelper:
	set(p_update_manager):
		if update_manager != p_update_manager:
			update_manager = p_update_manager
			update_configuration_warnings()

func _get_configuration_warnings():
	var warnings = []

	if !update_manager:
		warnings.append("Update Manager: Please assign a COP_UpdateManagerGlobalHelper 
			otherwise object will NOT be updated and auto setup will give error.")
	
	return warnings

## This method updates the update object.
func update(delta):
	_counter = 0
	while _counter <= 100:
		print(name, " -> ", _counter)
		_counter += 1
	pass

## This method activates/deactivates the update object.
func set_active(is_enable: bool):
	# NOTE: Your logic for activating and deactivating the update
	#       object MUST go here.
	pass

## This method checks if the update object is active or NOT.
func is_active():
	return _is_active # NOTE: Return the bool or the status of the object
#                        that will be used for checking if the update
#                        object is active or NOT.

#region The logic in this section MUST NOT BE CHANGED OR OVERRIDDEN!
## This method adds this object to the update manager._action_options
## THIS METHOD SHOULD NOT BE CALLED OR OVERRIDDEN. IT IS ONLY USED
## FOR AUTOMATION!
func _add_self_to_manager():
	if update_manager:
		update_manager.get_manager()._add_object(self)
	else:
		push_error("Error: ", name, " does not have update manager assigned!")

## This method always sends true as the script is an update object.
## This method is needed for duck typing check and SHOULD NOT BE
## OVERRIDDEN OR CHANGED!
func _is_update_object():
	return true
#endregion
