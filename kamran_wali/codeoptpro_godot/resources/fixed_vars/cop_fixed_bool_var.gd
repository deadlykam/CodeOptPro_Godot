class_name COP_FixedBoolVar
extends "res://kamran_wali/codeoptpro_godot/resources/fixed_vars/base_fixed_var.gd"

## Set the boolean value. Do NOT change value from script.
@export var _value: bool

func get_value() -> bool:
	return _value
