@tool
extends "res://addons/kamran_wali/code_opt_pro/scripts/pools/pool_local.gd"

func update(delta: float) -> void:
    # NOTE: It is recommended to call parent's update function
    super.update(delta) # Calling parent's update function
    # NOTE: Any frame update logic must be put here.

func _p_setup_object_pool() -> void:
    super._p_setup_object_pool() # The default pool object setup
    # NOTE: If you want to set up the pool objects in your own way
    #       at start up then you can do so here. If you do do so
    #       then you can remove the above code which calls the
    #       parent's default way of setting up the pool objects.
    #       Also make sure to clear the _p_objects array so that
    #       multiple same objects are NOT added.

## This method checks if the object is pool object.
func _p_is_pool_object(object: Node) -> bool:
    # Note: You can change the condition for checking if an object
    #       is a pool object. It is recommended to use the parent's
    #       default way to check if an object is pool object as that
    #       is the fastest way to do the check. But if you want to
    #       set some other way to validate then you may do so here.
    #       The variable _p_objects contains all the pool objects or
    #       should be added to. The variable _p_index_object is the
    #       loop counter.
    return super._p_is_pool_object(object)

## This method checks if the pool object is available.
func _p_is_pool_object_available(object: Node) -> bool:
    # Note: You can give conditions to check if a pool object
    #       is ready to be used. The object provided in the
    #       parameter is a pool object.
    return super._p_is_pool_object_available(object)