@tool
class_name COP_ObserverAction
extends Resource

signal action_changed()

## This method emits the signal
func action() -> void: action_changed.emit()

## This method removes/disconnects all the connected callable objects.
func disconnect_all() -> void:
    for dict in action_changed.get_connections():
        action_changed.disconnect(dict.Callable)