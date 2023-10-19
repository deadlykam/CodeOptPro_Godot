extends Node

@export var _timer: COP_BaseTimer
@export var _timer_time: COP_BaseTimer
@export var _time: float

func _ready():
	_timer.set_time(_time)

func _process(delta):
	if Input.is_action_just_pressed("ui_page_up"):
		_timer.reset_timer()
		_timer_time.reset_timer()
	
	if !_timer.is_timer_done():
		_timer.update_timer(delta)
		if _timer.is_timer_done():
			print("Timer is done!")
	
#	if !_timer_time.is_timer_done():
#		_timer_time.update_timer(delta)
#		if _timer.is_timer_done():
#			print("Timer_Time is done!")
