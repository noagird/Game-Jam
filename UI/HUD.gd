extends Control

func _ready():
	update_time()
	get_tree().paused = true
	$MessageColorRect.show()
	$Message.show()
	$Message/MessageTimer.start()

func _physics_process(_delta):
	_update_checkboxes()

func _on_MessageTimer_timeout():
	get_tree().paused = false
	$Message.hide()
	$MessageColorRect.hide()

func update_time():
	$TimerColorRect/Time.text = "Time: " + str(Global.time)

func _on_Timer_timeout():
	Global.time -= 1
	if Global.time < 0:
		var _scene = get_tree().change_scene("res://UI/Lose.tscn")
	else:
		update_time()

func _update_checkboxes():
	if Global.has_dough == true:
		$ColorRect/Dough.pressed = true
	else:
		pass
		
	if Global.has_tomato == true:
		$ColorRect/Tomato.pressed = true
	else:
		pass
		
	if Global.has_cheese == true:
		$ColorRect/Cheese.pressed = true
	else:
		pass
		
	if Global.has_sausage == true:
		$ColorRect/Sausage.pressed = true
	else:
		pass
