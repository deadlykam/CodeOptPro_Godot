@tool
extends "res://addons/kamran_wali/code_opt_pro/scripts/managers/updates/physics_process_manager_local.gd"

@export_category("Physics Process Manager Global")
@export var _helper: COP_UpdateManagerGlobalHelper

func _ready() -> void:
    super._ready()
    _helper.set_manager(self)

#region Automation methods. SHOULD NOT BE CALLED FROM OTHER SCRIPTS
func _physics_process(delta: float) -> void:
    super._physics_process(delta)
    if Engine.is_editor_hint(): # Logic for editor ONLY!
        if _helper: # Checking if helper ref given
            if !_helper.is_manager(self): # Check if self NOT set as manager
                _helper.set_manager(self) # Setting self as manager
#endregion
