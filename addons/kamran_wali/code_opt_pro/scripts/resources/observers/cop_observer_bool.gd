@tool
class_name COP_ObserverBool
extends Resource

signal value_changed(value:bool)

var _value:= false

## This method gets the value.
func get_value() -> bool: return _value

## This method gets the value and emits the signal.
func get_value_emit() -> bool:
    value_changed.emit(_value)
    return _value

## This method sets the value.
func set_value(value:bool) -> void: _value = value

## This method sets the value and emits the signal.
func set_value_emit(value:bool) -> void:
    set_value(value)
    value_changed.emit(value)