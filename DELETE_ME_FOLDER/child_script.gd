class_name ChildScript
extends Node

var _uid: int

func _ready() -> void:
	_uid = UID_GEN.get_uid()

func get_uid() -> int:
	return _uid
