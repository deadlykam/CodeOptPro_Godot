class_name COP_FixedStringVar
extends "res://kamran_wali/codeoptpro_godot/resources/fixed_vars/base_fixed_var.gd"

## Set the value. Do NOT change value from script.
@export var _value: String

func get_value() -> String:
	return _value

