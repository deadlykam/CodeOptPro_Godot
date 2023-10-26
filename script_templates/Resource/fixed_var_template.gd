@tool
#class_name COP_FixedSomeVar
extends Resource

# Make sure to update the value type.
## Set the value. Do NOT change value from script.
@export var _value: int

# Make sure to update the return type.
## This method gets the value
func get_value():
	return _value
