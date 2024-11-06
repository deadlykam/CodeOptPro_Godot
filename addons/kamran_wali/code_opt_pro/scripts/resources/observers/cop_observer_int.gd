@tool
class_name COP_ObserverInt
extends COP_IntVar

signal value_changed(value:int)

## This method gets the value and emits the signal.
func get_value_emit() -> int:
    value_changed.emit(get_value())
    return get_value()

## This method sets the value and emits the signal.
func set_value_emit(value:int) -> void:
    set_value(value)
    value_changed.emit(value)