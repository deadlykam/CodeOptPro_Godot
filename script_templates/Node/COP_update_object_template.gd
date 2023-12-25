extends Node # You may change the extension as you wish but the methods
#              here MUST remain for this object to become an update object

## This method updates the update object.
func update(delta: float) -> void:
	# NOTE: Your update logic MUST go here. That is the _process or
	#       _physics_process logic.
	pass

## This method activates/deactivates the update object.
func set_active(is_active: bool) -> void:
	# NOTE: Your logic for activating and deactivating the update
	#       object MUST go here.
	pass

## This method checks if the update object is active or NOT.
func is_active() -> bool:
	return false # NOTE: Return the bool or the status of the object
#                        that will be used for checking if the update
#                        object is active or NOT.

#region The logic in this section MUST NOT BE CHANGED OR OVERRIDDEN!
## This method always sends true as the script is an update object.
## This method is needed for duck typing check and SHOULD NOT BE
## OVERRIDDEN OR CHANGED!
func is_update_object() -> bool:
	return true
#endregion
