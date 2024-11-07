@tool
class_name COP_ObserverFloat
extends Resource

signal value_changed(value:float)

var _value: float

## This method gets the value.
func get_value() -> float: return _value

## This method gets the value and emits the signal.
func get_value_emit() -> float:
    value_changed.emit(_value)
    return _value

## This method sets the value.
func set_value(value: float) -> void: _value = value

## This method sets the value and emits the signal.
func set_value_emit(value:int) -> void:
    set_value(value)
    value_changed.emit(_value)