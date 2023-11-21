@tool
extends "res://addons/kamran_wali/code_opt_pro/scripts/bars/normal_bar.gd"

@export_category("Normal Bar Values")
## The maximum value for the bar.
@export var _max: COP_FixedFloatVar:
	set(p_max):
		if _max != p_max:
			_max = p_max
			update_configuration_warnings()

## Flag to check if to set the current value to max on ready or NOT. True
## means to set the current value to max on ready. False means to NOT set
## the current value to max on ready.
@export var _is_set_cur_value: COP_FixedBoolVar:
	set(p_is_set_cur_value):
		if _is_set_cur_value != p_is_set_cur_value:
			_is_set_cur_value = p_is_set_cur_value
			update_configuration_warnings()

func _get_configuration_warnings():
	var warnings: Array[String]
	
	if _max == null:
		warnings.append("Max: Please give a max value that is greater than 0.")
	elif  _max.get_value() <= 0:
		warnings.append("Max: The given max value is less than or equal to 0. 
			Must be greater than 0.")
	
	if _is_set_cur_value == null:
		warnings.append("Is Set Cur Value: Please give a flag value if to update 
			the current value on ready function.")
	
	return warnings

func _ready() -> void:
	set_max(_max.get_value())
	set_current(_max.get_value() if _is_set_cur_value.get_value() else 0)
