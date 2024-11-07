@tool
class_name COP_ObserverString
extends COP_StringVar

signal value_changed(value:String)

## This method gets the value and emits the signal.
func get_value_emit() -> String:
    value_changed.emit(get_value())
    return get_value()

## This method sets the value and emits the signal.
func set_value_emit(value:String) -> void:
    set_value(value)
    value_changed.emit(value)