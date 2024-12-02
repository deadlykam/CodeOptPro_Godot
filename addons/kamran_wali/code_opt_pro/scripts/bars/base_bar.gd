class_name COP_BaseBar
extends Node

var _value_max:= 1
var _value_cur:= 0

## This method sets the max value.
func set_max(value: int) -> void:
	_value_max = value if value > 0 else 1

## This method sets the current value with the given value, limit is 0 to max value.
func set_current(value: int) -> void:
	_value_cur = 0 if value < 0 else _value_max if value >= _value_max else value

## Gets the normal value of the bar
func get_normal() -> float:
	return float(_value_cur) / float(_value_max)

## The amount of value to add to the bar, limit is 0 to max value.
func add(value: int) -> void:
	if value > 0: # Condition for allowing current value addition
		_value_cur = _value_cur + value if (_value_cur + value) < _value_max else _value_max

## This method gets the max value of the bar.
func get_value_max() -> int:
	return _value_max

## This method gets the current value of the bar.
func get_value_current() -> int:
	return _value_cur

## This method checks if the bar is full.
func is_full() -> bool:
	return _value_cur == _value_max

## This method checks if the bar has been depleted.
func is_depleted() -> bool:
	return _value_cur == 0

## This method restors the bar to max.
func restore() -> void:
	_value_cur = _value_max

## The amount of value to subtract from the bar, limit is 0 to max value.
func subtract(value: int) -> void:
	pass
