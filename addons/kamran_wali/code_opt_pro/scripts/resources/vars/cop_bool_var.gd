@tool
class_name COP_BoolVar
extends Resource

var _value: bool

## This method gets the value.
func get_value() -> bool:
	return _value
	
## This method sets the value.
func set_value(value: bool):
	_value = value
