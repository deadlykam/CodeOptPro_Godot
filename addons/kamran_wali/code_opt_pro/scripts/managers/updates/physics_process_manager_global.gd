@tool
extends "res://addons/kamran_wali/code_opt_pro/scripts/managers/updates/physics_process_manager_local.gd"

@export_category("Physics Process Manager Global")
@export var _helper: COP_UpdateManagerGlobalHelper:
    set(p_helper):
        if _helper != p_helper:
            _helper = p_helper
            update_configuration_warnings()

func _get_configuration_warnings():
    var warnings: Array[String]

    if !_helper:
        warnings.append("Helper: Please assign a COP_UpdateManagerGlobalHelper 
            otherwise global update manager and auto setup won't work.")
    
    return warnings

func _ready() -> void:
    super._ready()
    _helper.set_manager(self)

#region Automation methods. SHOULD NOT BE CALLED FROM OTHER SCRIPTS
func _setup() -> void:
    _helper.set_manager(self)
#endregion
