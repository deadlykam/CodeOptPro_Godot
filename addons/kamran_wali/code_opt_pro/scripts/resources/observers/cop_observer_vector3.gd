@tool
class_name COP_ObserverVector3
extends Resource

signal value_changed(value:Vector3)

var _value: Vector3

## This method gets the value.
func get_value() -> Vector3: return _value

## This method gets the value and emits the signal.
func get_value_emit() -> Vector3:
    value_changed.emit(_value)
    return _value

## This method sets the value.
func set_value(value: Vector3) -> void: _value = value

## This method sets the value and emits the signal.
func set_value_emit(value:Vector3) -> void:
    set_value(value)
    value_changed.emit(_value)