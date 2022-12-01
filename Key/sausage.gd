extends Area

func _on_sausage_body_entered(body):
	if body.name == "Player":
		Global.has_sausage = true
		queue_free()
