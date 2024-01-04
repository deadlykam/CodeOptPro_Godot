@tool
extends COP_UpdateManager

func _process(delta: float) -> void:
    if !Engine.is_editor_hint():
        _update(delta * get_time_delta())