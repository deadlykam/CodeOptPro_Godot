@tool
#class_name COP_SomeVar
extends Resource

# Set the type of the _value for better performance.
var _value

# Set the return type for better performance.
## This method gets the value.
func get_value():
	return _value

# Set the parameter type for better performance.
## This method sets the value.
func set_value(value) -> void:
	_value = value
