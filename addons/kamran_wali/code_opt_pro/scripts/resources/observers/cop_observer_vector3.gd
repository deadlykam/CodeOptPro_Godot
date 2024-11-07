@tool
class_name COP_ObserverVector3
extends COP_Vector3Var

signal value_changed(value:Vector3)

## This method gets the value and emits the signal.
func get_value_emit() -> Vector3:
    value_changed.emit(get_value())
    return get_value()

## This method sets the value and emits the signal.
func set_value_emit(value:Vector3) -> void:
    set_value(value)
    value_changed.emit(value)