@tool
class_name COP_Pool
extends Node

@export_category("Base Pool")
@export var _helper: COP_PoolHelper
@export var _is_enable_at_start: COP_FixedBoolVar
@export var _p_objects: Array[Node]
@export var _pool_object_holder: Node

var _p_index_object:= 0
var _requests: Array[Node]
var _object_cur: Node
var _pointer_pool_object:= -1
var _is_active:= false

func _ready() -> void:
    if !Engine.is_editor_hint():
        _helper.set_manager(self)
        _is_active = _is_enable_at_start.get_value()
        _object_cur = null
        _requests.clear()

## This method updates the update object.
func update(delta: float) -> void:
    if !_requests.is_empty(): # Condition for getting a new request object
        _object_cur = _requests.pop_front() if _object_cur == null else _object_cur

    if _object_cur != null: # Condition for processing a current object
        _process_request(_get_pool_object())

## This method activates/deactivates the update object.
func set_active(is_enable: bool) -> void:
    _is_active = is_enable

## This method checks if the update object is active or NOT.
func is_active() -> bool:
    return _is_active

## This method handles all the setup that needs to be done during 
## automation setup process.
func auto_setup() -> void:
    if _pool_object_holder == null: # Condition for setting the default pool object holder
        _pool_object_holder = self
    _p_setup_object_pool() # Populating the with pool objects

## This method adds a pooling request to be processed.
func add_request(object: Node) -> void:
    _requests.append(object)

## This method sets up the pool objects at start up.
func _p_setup_object_pool() -> void:
    _p_objects.clear()
    _p_index_object = 0
    while(_p_index_object < _pool_object_holder.get_child_count()): # Loop for populating the object array
        if _p_is_pool_object(_pool_object_holder.get_child(_p_index_object)): # Checking if object is pool object
            _p_objects.append(_pool_object_holder.get_child(_p_index_object))
        _p_index_object += 1

## This method checks if the object is pool object.
func _p_is_pool_object(object: Node) -> bool:
    return true

## This method checks if the pool object is available.
func _p_is_pool_object_available(object: Node) -> bool:
    return true

## This method gets the available pool object.
func _get_pool_object() -> Object:
    _pointer_pool_object = 0 if (_pointer_pool_object + 1) >= _p_objects.size() else _pointer_pool_object + 1
    return _p_objects[_pointer_pool_object]

## This method process' the request.
func _process_request(object: Node) -> void:
    if _p_is_pool_object_available(object): # Validating pool object
        _object_cur._receive_pool_object(object)
        _object_cur = null # Current object processing done

## This method adds this object to the update manager.
func _add_self_to_manager() -> void:
    # NOTE: This method MUST be overriden in children scripts and use the correct manager to be set up.
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