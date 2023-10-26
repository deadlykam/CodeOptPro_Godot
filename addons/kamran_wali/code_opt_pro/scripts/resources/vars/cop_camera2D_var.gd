@tool
class_name COP_Camera2DVar
extends Resource

var _value: Camera2D

## This method gets the value.
func get_value() -> Camera2D:
	return _value

## This method sets the value.
func set_value(value: Camera2D) -> void:
	_value = value

