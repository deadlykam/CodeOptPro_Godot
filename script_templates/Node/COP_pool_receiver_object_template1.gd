@tool
extends Node

# NOTE: If the type of the object is known then please provide it
#       for better performance.
## This method receives a pool object
func _receive_pool_object(object) -> void:
    # NOTE: Any logic for receiving the pool object should be done here.
    pass

#region The logic in this section MUST NOT BE CHANGED OR OVERRIDDEN!
## This method always sends true as the script is a pool receiver.
## This method is needed for duck typing check and SHOULD NOT BE
## OVERRIDDEN OR CHANGED!
func _is_pool_receiver() -> bool:
    return true
#endregion