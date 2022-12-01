extends Area

func _on_cheese_body_entered(body):
	if body.name == "Player":
		Global.has_cheese = true
		queue_free()
