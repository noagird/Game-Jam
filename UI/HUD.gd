extends Control

func _ready():
	update_time()
	get_tree().paused = true
	$MessageColorRect.show()
	$Message.show()
	$Message/MessageTimer.start()

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
