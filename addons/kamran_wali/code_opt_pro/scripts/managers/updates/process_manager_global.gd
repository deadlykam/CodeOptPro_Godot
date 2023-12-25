extends "res://addons/kamran_wali/code_opt_pro/scripts/managers/updates/process_manager_local.gd"

@export_category("Process Manager Global")
@export var _helper: COP_UpdateManagerGlobalHelper

func _ready() -> void:
    super._ready()
    _helper.set_manager(self)

#region Automation methods. SHOULD NOT BE CALLED FROM OTHER SCRIPTS
# TODO: If automation is implemented then put those logic here.
#endregion