class_name COP_BaseTimer
extends Node

## This method sets/overrides the timer time.
func set_time(time_seconds: float) -> void:
	pass

## This method updates the timer with the given delta value.
func update_timer(delta: float) -> void:
	pass

## This method resets the timer.
func reset_timer() -> void:
	pass

## This method stops the timer.
func stop_timer() -> void:
	pass

## This method checks if the timer is done.
func is_timer_done() -> bool:
	return true

## This method gets the time second value that was set for the timer.
func get_time_seconds() -> float:
	return 0.0

## This method gets the current time second for the timer.
func get_current_time_seconds() -> float:
	return 0.0

## This method gets the normalized value of the timer, range 0.0 - 1.0.
func normalized() -> float:
	return 0.0
