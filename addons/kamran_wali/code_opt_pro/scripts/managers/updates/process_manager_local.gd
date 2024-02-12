@tool
extends COP_UpdateManager

var _index_status:= 0

func _process(delta: float) -> void:
	if !Engine.is_editor_hint():
		_update(delta * get_time_delta())

func set_enabled(is_enable: bool) -> void:
	set_process(is_enable)
	_index_status = 0

	while _index_status < get_size(): # Loop for calling enable/disable methods of update objects
		if is_enable: # Condition for calling on enable method in update objects
			if get_object_index(_index_status).has_method("on_enable"):
				get_object_index(_index_status).on_enable()
		else: # Condition for calling on disable method in update objects
			if get_object_index(_index_status).has_method("on_disable"):
				get_object_index(_index_status).on_disable()
		_index_status += 1

func is_enabled() -> bool:
	return is_processing()