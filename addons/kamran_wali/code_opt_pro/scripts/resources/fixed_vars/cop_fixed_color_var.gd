@tool
class_name COP_FixedColorVar
extends Resource

## Set the color value. Do NOT change value from script.
@export var _value: Color

func get_value() -> Color: return _value