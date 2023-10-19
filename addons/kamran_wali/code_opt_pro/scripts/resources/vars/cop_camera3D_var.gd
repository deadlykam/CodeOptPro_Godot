@tool
class_name COP_Camera3DVar
extends Resource

var _value: Camera3D

## This method gets the value.
func get_value() -> Camera3D:
	return _value

## This method sets the value.
func set_value(value: Camera3D) -> void:
	_value = value

