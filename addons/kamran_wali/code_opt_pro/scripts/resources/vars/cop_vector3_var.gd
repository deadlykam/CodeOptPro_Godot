@tool
class_name COP_Vector3Var
extends Resource

var _value: Vector3

## This method gets the value.
func get_value() -> Vector3: return _value
	
## This method sets the value.
func set_value(value: Vector3) -> void: _value = value

