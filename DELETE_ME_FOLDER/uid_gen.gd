class_name UID_GEN
extends Node

static var _uid: int

static func get_uid() -> int:
	_uid = _uid + 1;
	return _uid
