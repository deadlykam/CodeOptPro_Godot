@tool
class_name COP_ObserverVector2
extends COP_Vector2Var

signal value_changed(value:Vector2)

## This method gets the value and emits the signal.
func get_value_emit() -> Vector2:
    value_changed.emit(get_value())
    return get_value()

## This method sets the value and emits the signal.
func set_value_emit(value:Vector2) -> void:
    set_value(value)
    value_changed.emit(value)