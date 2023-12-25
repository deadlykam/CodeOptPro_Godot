extends Node

@export var update_manager: COP_BaseUpdateManager
@export var timer: COP_BaseTimer
@export var time: float
@export var _is_active:= true

func _ready():
	timer.set_time(time)
	timer.reset_timer()

## This method updates the update object.
func update(delta: float):
	if timer.is_timer_done():
		print(name, " -> Timer Done!")
		timer.reset_timer()
	else:
		timer.update_timer(delta)

## This method activates/deactivates the update object.
func set_active(is_active: bool):
	# NOTE: Your logic for activating and deactivating the update
	#       object MUST go here.
	pass

## This method checks if the update object is active or NOT.
func is_active():
	return _is_active

#region The logic in this section MUST NOT BE CHANGED OR OVERRIDDEN!
## This method always sends true as the script is an update object.
## This method is needed for duck typing check and SHOULD NOT BE
## OVERRIDDEN OR CHANGED!
func is_update_object():
	return true
#endregion
