extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Music_Lose.playing = true

func _on_Play_pressed():
	var _scene = get_tree().change_scene("res://Game.tscn")
	Global.time = 300


func _on_Quit_pressed():
	get_tree().quit()
