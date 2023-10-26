@tool
class_name COP_Node2DVar
extends Resource

var _value: Node2D

## This method gets the value.
func get_value() -> Node2D:
	return _value
	
## This method sets the value.
func set_value(value: Node2D) -> void:
	_value = value

