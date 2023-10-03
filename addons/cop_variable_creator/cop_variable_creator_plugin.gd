@tool
extends EditorPlugin

var _dock

func _enter_tree():
	_dock = preload("res://addons/cop_variable_creator/variable_creator.tscn").instantiate()
	add_control_to_dock(DOCK_SLOT_LEFT_UL, _dock)
	pass


func _exit_tree():
	remove_control_from_docks(_dock)
	_dock.free()
