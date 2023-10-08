@tool
class_name COP_FixedVector3Var
extends Resource

## Set the value. Do NOT change value from script.
@export var _value: Vector3

func get_value() -> Vector3:
	return _value

