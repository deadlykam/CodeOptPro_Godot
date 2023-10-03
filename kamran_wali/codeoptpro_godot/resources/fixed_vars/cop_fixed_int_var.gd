class_name COP_FixedIntVar
extends "res://kamran_wali/codeoptpro_godot/resources/fixed_vars/base_fixed_var.gd"

## Set the value. Do NOT change value from script.
@export var _value: int

func get_value() -> int:
	return _value

