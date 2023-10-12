@tool
class_name COP_FixedBoolVar
extends Resource

## Set the boolean value. Do NOT change value from script.
@export var _value: bool

func get_value() -> bool:
	return _value
