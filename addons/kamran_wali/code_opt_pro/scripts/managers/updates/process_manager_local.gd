extends COP_BaseUpdateManager

func _process(delta) -> void:
    update(delta * get_time_delta())