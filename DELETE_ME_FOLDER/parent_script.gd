extends Node

@export var _child: ChildScript

func _process(delta) -> void:
	if Input.is_action_just_pressed("ui_page_up"):
		print("My Child's ID: " , _child.get_uid())
