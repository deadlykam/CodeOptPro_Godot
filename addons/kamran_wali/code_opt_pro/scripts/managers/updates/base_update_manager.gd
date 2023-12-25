@tool
class_name COP_UpdateManager
extends Node

# TODO: Add the methods for automation inside the region if automation is implemented. Check COP.
#       Also when adding an object make sure to check it has the method is_update_object(). That
#       way no extra checks are required when updating the object. Maybe also check if the object
#       has void update(float), void set_active(bool) and bool is_active methods as well(optional).

@export_category("Update Manager Local")
@export var _objects: Array[Node]

## Number of objects to update per frame. Min value is 1
@export var _num_update := 1:
    set(p_num_update):
        if _num_update != p_num_update:
            _num_update = 1 if p_num_update < 1 else p_num_update

var _pointer := 0
var _index_update: int
var _time_delta: float
var _actual_num_update: int # This is the actual number of objects to update

func _ready() -> void:
    _calculate_time_delta() # Calculating the delta time for the update manager
    _validate_num_update() # Validting the actual number of objects to update

## This method updates the update manager and MUST only be called by 
## its children and NO other scripts.
func update(delta: float) -> void:
    if  _objects.size() != 0:
        if _num_update == 1: # Condition for updating 1 object per frame
            _update_object(delta)
        else: # Condition for updating n objects per frame
            _index_update = 0
            while _index_update < _actual_num_update:
                _update_object(delta)
                _index_update += 1

## This method gets the time delta value for the manager.
func get_time_delta() -> float:
    return _time_delta

## This method gets the process time delta value for the manager.
func get_time_delta_process() -> float:
    return _time_delta * get_process_delta_time()

## This method gets the physics process time delta value for the manager.
func get_time_delta_physics_process() -> float:
    return _time_delta * get_physics_process_delta_time()

## This method updates the active object.
func _update_object(delta: float) -> void:
    if _objects[_pointer].is_active(): # Checking if object is active
        _objects[_pointer].update(delta) # Updating the object
    
    _pointer = 0 if _pointer + 1 >= _objects.size() else _pointer + 1

## This method calculates the time delta for the update manager.
func _calculate_time_delta() -> void:
    _time_delta = float(_objects.size()) / float(_num_update)
    _time_delta = 1.0 if _time_delta <= 1.0 else _time_delta

## This method calculates the actual number of objects to update.
func _validate_num_update() -> void:
    _actual_num_update = _objects.size() if _objects.size() <= _num_update else _num_update

## This method always sends true as the script is 
## update_manager. This method is needed for duck
## typing check and SHOULD NOT be OVERRIDDEN!
func is_update_manager() -> bool:
    return true