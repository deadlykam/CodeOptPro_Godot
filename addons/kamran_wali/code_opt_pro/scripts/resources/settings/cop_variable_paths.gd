@tool
class_name COP_VariablePaths
extends Resource

@export var _paths: Array[String]

## This method updates the indexth path.
func update_var_path(index: int, path: String) -> void:
	_paths[index] = path
	ResourceSaver.save(self, resource_path, 0)

## This method gets the variable path.
func get_var_path(index: int) -> String:
	return _paths[index]
