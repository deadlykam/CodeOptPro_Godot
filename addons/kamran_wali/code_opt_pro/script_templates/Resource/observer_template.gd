@tool
#class_name COP_ObserverSomeVar
extends Resource

# Set the value type for better performance
signal value_changed(value)

# Set the type of the _value for better performance.
var _value

# Set the return type for better performance.
## This method gets the value.
func get_value(): return _value

# Set the return type for better performance
## This method gets the value and emits the signal
func get_value_emit():
    value_changed.emit(_value)
    return _value

# Set the parameter type for better performance.
## This method sets the value.
func set_value(value) -> void: _value = value

# Set the type for the value for better performance.
## This method sets the value and emits the signal
func set_value_emit(value) -> void:
    set_value(value)
    value_changed.emit(_value)