@tool
extends EditorPlugin

const COP_VARIABLE_CREATOR: GDScript = preload("res://addons/kamran_wali/code_opt_pro/cop_variable_creator/cop_variable_creator.gd")

var _dock

func _enter_tree():
	COP_VARIABLE_CREATOR.set_plugin(self) # Setting the plugin.
	_dock = preload("res://addons/kamran_wali/code_opt_pro/cop_variable_creator/variable_creator.tscn").instantiate()
	add_control_to_dock(DOCK_SLOT_RIGHT_BL, _dock)

func _exit_tree():
	COP_VARIABLE_CREATOR.set_plugin(null) # Removing the plugin.
	remove_control_from_docks(_dock)
	_dock.free()
