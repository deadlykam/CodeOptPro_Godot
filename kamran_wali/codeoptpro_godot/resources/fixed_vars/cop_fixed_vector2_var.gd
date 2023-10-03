class_name COP_FixedVector2Var
extends "res://kamran_wali/codeoptpro_godot/resources/fixed_vars/base_fixed_var.gd"

## Set the value. Do NOT change value from script.
@export var _value: Vector2

func get_value() -> Vector2:
	return _value

