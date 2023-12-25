extends COP_BaseUpdateManager

func _physics_process(delta: float) -> void:
    update(delta * get_time_delta())