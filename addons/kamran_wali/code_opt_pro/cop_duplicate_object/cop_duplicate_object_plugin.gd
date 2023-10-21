@tool
extends EditorPlugin

const COP_DUPLICATE_OBJECT: GDScript = preload("res://addons/kamran_wali/code_opt_pro/cop_duplicate_object/cop_duplicate_object.gd")

var _dock

func _enter_tree():
	COP_DUPLICATE_OBJECT.set_plugin(self) # Setting the plugin.
	_dock = preload("res://addons/kamran_wali/code_opt_pro/cop_duplicate_object/duplicate_object.tscn").instantiate()
	add_control_to_dock(DOCK_SLOT_RIGHT_BL, _dock)

func _exit_tree():
	COP_DUPLICATE_OBJECT.set_plugin(null) # Removing the plugin.
	remove_control_from_docks(_dock)
	_dock.free()
