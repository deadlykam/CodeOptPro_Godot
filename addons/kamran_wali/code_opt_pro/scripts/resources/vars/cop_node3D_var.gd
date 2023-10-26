@tool
class_name COP_Node3DVar
extends Resource

var _value: Node3D

## This method gets the value.
func get_value() -> Node3D:
	return _value

## This method sets the value.
func set_value(value) -> void:
	_value = value

