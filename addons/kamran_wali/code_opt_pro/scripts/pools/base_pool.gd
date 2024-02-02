@tool
class_name COP_Pool
extends Node

@export_category("Base Pool")
# TODO: Give manager helper resource here which is dynamic and will only call AddRequest method. Kinda like delegates in C#
@export var _is_enable_at_start: COP_FixedBoolVar
@export var _objects: Array

var _p_index_object
var _requests: Array
var _object_cur
var _pointer_process:= 0
var _pointer_pool_object:= -1
var _is_active:= false

func _ready() -> void:
    # TODO: Set the manager helper/delegateisc here.
    _is_active = _is_enable_at_start.get_value()

## This method updates the update object.
func update(delta: float) -> void:
    # NOTE: Your update logic MUST go here. That is the _process or
    #       _physics_process logic.
    pass

## This method activates/deactivates the update object.
func set_active(is_enable: bool) -> void:
    _is_active = is_enable

## This method checks if the update object is active or NOT.
func is_active() -> bool:
    return _is_active

## This method handles all the setup that needs to be done during 
## automation setup process.
func auto_setup() -> void:
    # TODO: Call the method that will probably populate the array with objects.
    pass

## TODO: This method adds a pooling request to be processed.
func add_request(object: Object) -> void:
    _requests.push_front(object)

## This method adds this object to the update manager.
func _add_self_to_manager() -> void:
    # TODO: This method MUST be overriden in children scripts and use the correct manager to be set up.
    pass

#region The logic in this section MUST NOT BE CHANGED OR OVERRIDDEN!
## This method always sends true as the script is an update object.
## This method is needed for duck typing check and SHOULD NOT BE
## OVERRIDDEN OR CHANGED!
func _is_update_object() -> bool:
    return true

## This method always sends true as the script is an auto setup object.
## This method is needed for duck typing check and SHOULD NOT BE
## OVERRIDDEN OR CHANGED!
func _is_auto_setup_object() -> bool:
    return true

## This method always sends true as the script is a pool manager.
## This method is needed for duck typing check and SHOULD NOT BE
## OVERRIDDEN OR CHANGED!
func _is_pool_manager() -> bool:
    return true
#endregion