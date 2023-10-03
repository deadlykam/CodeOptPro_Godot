#class_name COP_FixedSomeVar
extends "res://kamran_wali/codeoptpro_godot/resources/fixed_vars/base_fixed_var.gd"

# Make sure to update the value type.
## Set the value. Do NOT change value from script.
@export var _value: int

# Make sure to update the return type.
func get_value():
	return _value
