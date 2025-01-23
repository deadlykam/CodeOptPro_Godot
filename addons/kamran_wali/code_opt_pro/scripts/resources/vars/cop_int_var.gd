@tool
class_name COP_IntVar
extends Resource

var _value: int

## This method gets the value.
func get_value() -> int: return _value
	
## This method sets the value.
func set_value(value: int) -> void: _value = value

