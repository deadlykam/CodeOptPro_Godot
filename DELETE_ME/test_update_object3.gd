@tool
extends Node

## The local update manager that will update this object.
@export var update_manager: COP_UpdateManager
@export var _is_active:= true

## This method updates the update object.
func update(delta: float) -> void:
	print(name, " has been added!")
	pass

## This method activates/deactivates the update object.
func set_active(is_active: bool) -> void:
	_is_active = is_active()

## This method checks if the update object is active or NOT.
func is_active() -> bool:
	return _is_active

#region The logic in this section MUST NOT BE CHANGED OR OVERRIDDEN!
func _add_self_to_manager() -> void:
	if update_manager:
		update_manager._add_object(self)
	else:
		push_error("Error!, ", name, " does not have update manager assigned!")

## This method always sends true as the script is an update object.
## This method is needed for duck typing check and SHOULD NOT BE
## OVERRIDDEN OR CHANGED!
func _is_update_object() -> bool:
	return true
#endregion

