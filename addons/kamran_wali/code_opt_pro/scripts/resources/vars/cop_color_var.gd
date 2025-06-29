@tool
class_name COP_ColorVar
extends Resource

var _value: Color

## This method gets the value.
func get_value() -> Color: return _value

## This method sets the value.
func set_value(value: Color) -> void: _value = value