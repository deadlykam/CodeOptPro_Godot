@tool
extends "res://addons/kamran_wali/code_opt_pro/scripts/timers/timer_countdown.gd"

@export_category("Timer Countdown Time")
## Any float value given is considered to be in seconds.
@export var _time_seconds: COP_FixedFloatVar:
	set(p_time_seconds):
		if _time_seconds != p_time_seconds:
			_time_seconds = p_time_seconds
			update_configuration_warnings()

func _get_configuration_warnings():
	var warnings: Array[String]
	
	if _time_seconds == null:
		warnings.append("Time Seconds: Please give a time second. It can not be null.")
	else:
		if _time_seconds.get_value() <= 0.0:
			warnings.append("Time Seconds: The time value should not be less" +
				 " than or equal to 0.")
	
	return warnings

func _ready() -> void:
	super.set_time(_time_seconds.get_value())
