class_name COP_FixedFloatVar
extends "res://kamran_wali/codeoptpro_godot/resources/fixed_vars/base_fixed_var.gd"

## Set the value. Do NOT change value from script.
@export var _value: float

func get_value() -> float:
	return _value

