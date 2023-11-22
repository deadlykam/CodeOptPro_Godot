@tool
extends "res://addons/kamran_wali/code_opt_pro/scripts/bars/base_bar.gd"

func subtract(value: int) -> void:
	_value_cur = 0 if (_value_cur - value) <= 0 else _value_cur - value
