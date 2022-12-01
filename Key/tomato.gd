extends Area

func _on_tomato_body_entered(body):
	if body.name == "Player":
		Global.has_tomato = true
		queue_free()
