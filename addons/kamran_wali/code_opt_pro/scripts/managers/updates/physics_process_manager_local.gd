@tool
extends COP_UpdateManager

func _physics_process(delta: float) -> void:
    if !Engine.is_editor_hint():
        update(delta * get_time_delta())