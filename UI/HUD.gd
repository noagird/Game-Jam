extends Control

onready var doughItem = preload("res://Key/loaf.tscn")
onready var tomatoItem = preload("res://Key/tomato.tscn")
onready var sausageItem = preload("res://Key/sausage.tscn")
onready var cheeseItem = preload("res://Key/cheese.tscn")


func _ready():
	get_tree().paused = true
	$MessageColorRect.show()
	$Message.show()
	$Message/MessageTimer.start()

func _on_MessageTimer_timeout():
	get_tree().paused = false
	$Message.hide()
	$MessageColorRect.hide()


func _on_radio_toggled(button_pressed,name,value):
#if the checkbox is unchecked we don't need to do any thing
	if(!button_pressed):
		return
#looping through the group node children and uncheck every on expect the sender checkbox
	for i in $group.get_children() :
		if(i.name != name):
			i.pressed = false
		pass
	pass
