extends Control

func _ready():
	$Music_Intro_Loop.playing = true

func _on_Play_pressed():
	var _scene = get_tree().change_scene("res://Game.tscn")
	Global.time = 300


func _on_Quit_pressed():
	get_tree().quit()
