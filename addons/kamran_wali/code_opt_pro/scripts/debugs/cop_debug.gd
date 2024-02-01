class_name COP_Debug

## This method prints the log message and the script name.
static func print_script(object: Object, message: String) -> void:
    print(get_script_log(object, message))

## This method prints the log message the node name.
static func print_node(object: Node, message: String) -> void:
    print(object.name, " -> ", message)

# static func print_script_node(object, message: String) -> void:
#     print_script(object, print

## This method gets the script log.
static func get_script_log(object: Object, message: String) -> String:
    if object.has_method("get_path"):
        return object.get_script().get_path() + "=========\n" + message + "\n========="
    else:
        return "COP_Debug -> ERROR: No Script Found! Please provide a script"

#TODO: Create a method that gets the node log