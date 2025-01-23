@tool
class_name COP_Vector2Var
extends Resource

var _value: Vector2

## This method gets the value.
func get_value() -> Vector2: return _value
	
## This method sets the value.
func set_value(value: Vector2) -> void: _value = value

