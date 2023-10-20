@tool
extends COP_BaseTimer

var _time_set: float # Main timer that will remain constant unless changed.
var _time_current: float # Current timer that will change with countdown.

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
