@tool
class_name COP_FixedFloatVar
extends Resource

## Set the value. Do NOT change value from script.
@export var _value: float

func get_value() -> float:
	return _value

