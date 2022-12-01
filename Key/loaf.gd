extends Area


func _on_loaf_body_entered(body):
	if body.name == "Player":
		Global.has_dough = true
		queue_free()
