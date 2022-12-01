extends Area

var Pickup = preload("res://Player/Blaster.tscn")

func disappear():
	queue_free()
