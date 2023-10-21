@tool
extends "res://addons/kamran_wali/code_opt_pro/scripts/code_opt_pros/base_plugin.gd"

const _FROM_FILES = "res://"

# Properties from the scene.
var _object_path_txt: LineEdit
var _object_status: Label
var _parent_status_lbl: Label
var _num_duplicate: LineEdit
var _duplicate_button: CanvasItem
var _lock_button: CheckButton

# Properties needed internally.
var _parent_node: Node
var _object
var _object_dup
var _index: int
var _counter: int
var _is_parent: bool
var _is_object: bool
var _is_number: bool

func _enter_tree() -> void:
	# Setting up the scene variables
	_object_path_txt = $MainContainer/ObjectContainer/ObjectPath_Txt
	_object_status = $MainContainer/ObjectContainer/ObjectStatus
	_parent_status_lbl = $MainContainer/ParentContainer/ParentStatus
	_num_duplicate = $MainContainer/NumberContainer/Input_Number
	_duplicate_button = $MainContainer/DuplicateButton
	_lock_button = $MainContainer/ParentContainer/LockButton
	set_control_font_colour(_object_status, Color.INDIAN_RED) # Setting the colour at start.

func update(delta: float) -> void:
	if _is_parent_selected(): # Checking if parent has been selected.
		# Checking if new parent has been selected and if locked button is disabled.
		if _parent_node != _get_selected_parent_node() && !_lock_button.button_pressed:
			_parent_node = _get_selected_parent_node() # Updating the parent.
			
			if _parent_node != null: # Checking if parent node is NOT null.
				_parent_status_lbl.set_text(_parent_node.name) # Updating the parent status.
				set_control_font_colour(_parent_status_lbl, Color.GREEN)
				_is_parent = true # Parent selected
	else: # Condition for giving error for NOT selecting parent OR too many selection.
		_parent_status_lbl.set_text("Please select a parent Node object.")
		set_control_font_colour(_parent_status_lbl, Color.INDIAN_RED)
		_is_parent = false # Parent NOT selected
	
	if _is_show_button(): # Showing the button.
		_duplicate_button.show()
	else: # Hiding the button.
		_duplicate_button.hide()

func _on_object_path_txt_text_changed(path: String):
	if _is_object_exist(path): # Checking if the object exists.
		_object_status.set_text("Object Found!")
		set_control_font_colour(_object_status, Color.GREEN)
		_is_object = true # Object selected
	else: # Object does NOT exist.
		_object_status.set_text("Object NOT Found!")
		set_control_font_colour(_object_status, Color.INDIAN_RED)
		_is_object = false # Object NOT selected

func _on_input_number_text_changed(value: String):
	_is_number = is_int(value)
	if _is_number:
		set_control_font_colour(_num_duplicate, Color.WHITE)
	else:
		set_control_font_colour(_num_duplicate, Color.INDIAN_RED)

func _on_duplicate_button_pressed():
	_counter = _num_duplicate.get_text().to_int() # Getting the counter value.
	
	for _index in range(0, _counter): # Loop for creating objects.
		if _is_packedscene_object(): # Condition for duplicating PackedScenes.
			_object = load(_object_path_txt.get_text())
			_object_dup = _object.instantiate()
		else: # Condition for duplicating Scene Nodes.
			_object = get_scene_root_node().get_node(_object_path_txt.get_text())
			_object_dup = _object.duplicate()
		
		_parent_node.add_child(_object_dup, true) # Adding object and making name readable.
		_object_dup.set_owner(get_scene_root_node()) # Setting the ownership to the correct scene.

## This method checks if the a parent object has been selected.
func _is_parent_selected() -> bool:
	return (EDITOR_PLUGIN.get_editor_interface().get_selection().get_selected_nodes().size() != 0
		|| _parent_node != null)

## This method gets the selected parent node.
func _get_selected_parent_node() -> Node:
	if EDITOR_PLUGIN.get_editor_interface().get_selection().get_selected_nodes().size() == 0:
		return null
	
	return EDITOR_PLUGIN.get_editor_interface().get_selection().get_selected_nodes()[0]

## This method checks if the given object exists.
func _is_object_exist(path: String) -> bool:
	return FileAccess.file_exists(path) || EDITOR_PLUGIN.get_editor_interface().get_edited_scene_root().has_node(path)

## This method checks if to show the button.
func _is_show_button() -> bool:
	return _is_parent && _is_object && _is_number

## This method checks if the object given is a packed scene or NOT.
func _is_packedscene_object() -> bool:
	if _object_path_txt.get_text().length() >= _FROM_FILES.length():
		if _object_path_txt.get_text().substr(0, _FROM_FILES.length()).contains(_FROM_FILES):
			return true
	return false
