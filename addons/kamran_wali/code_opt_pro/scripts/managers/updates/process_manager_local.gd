extends COP_BaseUpdateManager

func _process(delta: float) -> void:
    update(delta * get_time_delta())