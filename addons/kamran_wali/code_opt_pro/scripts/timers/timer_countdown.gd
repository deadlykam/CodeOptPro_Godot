@tool
extends COP_BaseTimer

@export_category("Timer Countdown")
@export var _time_seconds: COP_FixedFloatVar:
	set(p_time_seconds):
		if _time_seconds != p_time_seconds:
			_time_seconds = p_time_seconds
			update_configuration_warnings()

var _time_set: float # Main timer that will remain constant unless changed.
var _time_current: float # Current timer that will change with countdown.

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
	set_time(_time_seconds.get_value())

func set_time(time_seconds: float) -> void:
	_time_set = time_seconds
	_time_current = time_seconds

func is_timer_done() -> bool:
	return _time_current == _time_set

func normalized() -> float:
	return _time_current / _time_set

func get_current_time_seconds() -> float:
	return _time_current

func reset_timer() -> void:
	_time_current = 0.0

func stop_timer() -> void:
	_time_current = _time_set

func get_time_seconds() -> float:
	return _time_set

func update_timer(delta: float) -> void:
	if (_time_current != _time_set):
		_time_current = _time_set if _time_current + delta >= _time_set else _time_current + delta
