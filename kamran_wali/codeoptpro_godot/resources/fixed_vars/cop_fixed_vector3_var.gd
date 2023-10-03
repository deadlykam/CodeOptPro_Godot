class_name COP_FixedVector3Var
extends "res://kamran_wali/codeoptpro_godot/resources/fixed_vars/base_fixed_var.gd"

## Set the value. Do NOT change value from script.
@export var _value: Vector3

func get_value() -> Vector3:
	return _value

