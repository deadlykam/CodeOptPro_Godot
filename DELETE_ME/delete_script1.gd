extends Node

@export var some_flag: COP_FixedBoolVar

func _ready():
    COP_Debug.print_node(self, "My name is " + name)
    COP_Debug.print_script(self, "This is my script")
    COP_Debug.print_script_node(self, "Ok ok will work")
    COP_Debug.print_resource(some_flag, "This is my flag")