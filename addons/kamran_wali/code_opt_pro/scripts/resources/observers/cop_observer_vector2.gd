@tool
class_name COP_ObserverVector2
extends Resource

signal value_changed(value:Vector2)

var _value: Vector2

## This method gets the value.
func get_value() -> Vector2: return _value

## This method gets the value and emits the signal.
func get_value_emit() -> Vector2:
    value_changed.emit(_value)
    return _value

## This method sets the value.
func set_value(value: Vector2) -> void: _value = value

## This method sets the value and emits the signal.
func set_value_emit(value:Vector2) -> void:
    set_value(value)
    value_changed.emit(_value)

## This method removes/disconnects all the connected callable objects.
func disconnect_all() -> void:
    for dict in value_changed.get_connections():
        value_changed.disconnect(dict.Callable)