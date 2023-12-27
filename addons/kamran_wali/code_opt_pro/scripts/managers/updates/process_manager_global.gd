@tool
extends "res://addons/kamran_wali/code_opt_pro/scripts/managers/updates/process_manager_local.gd"

@export_category("Process Manager Global")
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
# func _process(delta: float) -> void:
#     super._process(delta)
#     if Engine.is_editor_hint(): # Logic for editor ONLY!
#         if _helper: # Checking if helper ref given
#             if !_helper.is_manager(self): # Check if self NOT set as manager
#                 _helper.set_manager(self) # Setting self as manager

func _setup() -> void:
    _helper.set_manager(self)
#endregion