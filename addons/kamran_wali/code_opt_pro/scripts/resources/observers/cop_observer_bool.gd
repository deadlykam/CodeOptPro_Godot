@tool
class_name COP_ObserverBool
extends COP_BoolVar

signal value_changed(value:bool)

## This method gets the value and emits the signal.
func get_value_emit() -> bool:
    value_changed.emit(get_value())
    return get_value()

## This method sets the value and emits the signal.
func set_value_emit(value:bool) -> void:
    set_value(value)
    value_changed.emit(value)