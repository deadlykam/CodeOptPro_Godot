extends Node

@export var _some_boolean: COP_FixedBoolVar

func _ready():
	print("Value: %s" % _some_boolean.get_value())
	_some_boolean._value = false
	print("Value: %s" % _some_boolean.get_value())
