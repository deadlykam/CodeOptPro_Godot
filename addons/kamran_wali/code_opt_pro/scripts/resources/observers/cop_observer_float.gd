@tool
class_name COP_ObserverFloat
extends COP_FloatVar

signal value_changed(value:float)

## This method gets the value and emits the signal.
func get_value_emit() -> float:
    value_changed.emit(get_value())
    return get_value()

## This method sets the value and emits the signal.
func set_value_emit(value:int) -> void:
    set_value(value)
    value_changed.emit(value)