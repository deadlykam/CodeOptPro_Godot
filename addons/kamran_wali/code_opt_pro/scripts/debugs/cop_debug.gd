class_name COP_Debug
## Debugger to help print debugs.
##
## This script helps with printing debugs.

## This method prints the log message and the script name.
static func print_script(object: Object, message: String) -> void:
    print(get_script_log(object, message))

## This method prints the log message the node name.
static func print_node(object: Node, message: String) -> void:
    print(get_node_log(object, message))

## This method prints the log message and the resource name.
static func print_resource(object: Resource, message: String) -> void:
    print(get_resource_log(object, message))

## This method prints the log message and the object name and ID.
static func print_object(object: Object, message: String) -> void:
    print(get_object_log(object, message))

## This method gets the script log.
static func get_script_log(object: Object, message: String) -> String:
    if object.has_method("get_path"):
        return "=========\n***" + object.get_script().get_path() + "***\n" + message + "\n========="
    else:
        return "COP_Debug.get_script_log() -> ERROR: No Script Found! Please provide a script."

## This method gets the node log.
static func get_node_log(object: Node, message: String) -> String:
    return object.name + " -> " + message

## This method gets the resource log.
static func get_resource_log(object: Resource, message: String) -> String:
    if object.has_method("take_over_path"):
        return object.resource_path.get_file().trim_suffix(".tres") + " -> " + message
    else:
        return "COP_Debug.get_resource_log() -> Error: No Resource Found! Please provide a resource."

## This method gets the object log.
static func get_object_log(object: Object, message: String) -> String:
    if object.has_method("to_string"):
        return object.to_string() + " -> " + message
    else:
        return "COP_Debug.get_object_log() -> Error: No Object found! Please provide an object."