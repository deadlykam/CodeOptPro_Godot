@tool
extends Node # You may change the extension as you wish but the methods
#              here MUST remain for this object to become an update object

## The global update manager that will update this object.
@export var update_manager: COP_UpdateManagerGlobalHelper:
	set(p_update_manager):
		if update_manager != p_update_manager:
			update_manager = p_update_manager
			update_configuration_warnings()

@export var _is_active:= true

func _get_configuration_warnings():
	# var warnings

	# if !update_manager:
	# 	warnings.append("Update Manager: Please assign a COP_UpdateManagerGlobalHelper 
	# 		otherwise object will NOT be updated and auto setup will give error.")
	
	# return warnings

	if update_manager == null:
		return "Update Manager: Please assign a COP_UpdateManagerGlobalHelper 
			otherwise object will NOT be updated and auto setup will give error."

## This method updates the update object.
func update(delta):
	print(name, " has been added!")
	pass

## This method activates/deactivates the update object.
func set_active(is_active: bool):
	_is_active = is_active()
	pass

## This method checks if the update object is active or NOT.
func is_active():
	return _is_active

#region The logic in this section MUST NOT BE CHANGED OR OVERRIDDEN!
func _add_self_to_manager():
	if update_manager:
		update_manager._add_object(self)
	else:
		push_error("Error: ", name, " does not have update manager assigned!")

## This method always sends true as the script is an update object.
## This method is needed for duck typing check and SHOULD NOT BE
## OVERRIDDEN OR CHANGED!
func _is_update_object():
	return true
#endregion
