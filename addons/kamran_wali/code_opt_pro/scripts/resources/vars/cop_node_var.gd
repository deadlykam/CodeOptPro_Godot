@tool
class_name COP_NodeVar
extends Resource

var _value: Node

## This method gets the value.
func get_value() -> Node:
	return _value

## This method sets the value.
func set_value(value: Node) -> void:
	_value = value

