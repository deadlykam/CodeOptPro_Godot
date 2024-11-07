@tool
class_name COP_ObserverInt
extends Resource

signal value_changed(value:int)

var _value: int

## This method gets the value.
func get_value() -> int: return _value

## This method gets the value and emits the signal.
func get_value_emit() -> int:
    value_changed.emit(_value)
    return _value

## This method sets the value.
func set_value(value: int) -> void: _value = value

## This method sets the value and emits the signal.
func set_value_emit(value:int) -> void:
    set_value(value)
    value_changed.emit(_value)

## This method removes/disconnects all the connected callable objects.
func disconnect_all() -> void:
    for dict in value_changed.get_connections():
        value_changed.disconnect(dict.Callable)