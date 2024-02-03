@tool
extends COP_Pool

@export_category("Base Pool Global")
## The global update manager that will update this object.
@export var update_manager: COP_UpdateManagerGlobalHelper:
	set(p_update_manager):
		if update_manager != p_update_manager:
			update_manager = p_update_manager
			update_configuration_warnings()

func _get_configuration_warnings():
	var warnings = []

	if !update_manager:
		warnings.append("Update Manager: Please assign a COP_UpdateManagerGlobalHelper 
			otherwise object will NOT be updated and auto setup will give error.")
	
	return warnings

#region The logic in this section MUST NOT BE CHANGED OR OVERRIDDEN!
## This method adds this object to the update manager.
## THIS METHOD SHOULD NOT BE CALLED OR OVERRIDDEN. IT IS ONLY USED
## FOR AUTOMATION!
func _add_self_to_manager():
	if update_manager:
		update_manager.get_manager()._add_object(self)
	else:
		push_error("Error: ", name, " does not have update manager assigned!")
#endregion
