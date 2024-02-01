@tool
extends Node # You may change the extension as you wish but the methods
#              here MUST remain for this object to become an auto setup object

## This method handles all the setup that needs to be done during 
## automation setup process.
func auto_setup() -> void:
    pass

#region The logic in this section MUST NOT BE CHANGED OR OVERRIDDEN!
## This method always sends true as the script is an auto setup object.
## This method is needed for duck typing check and SHOULD NOT BE
## OVERRIDDEN OR CHANGED!
func _is_auto_setup_object() -> bool:
    return true
#endregion