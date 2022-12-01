extends AudioStreamPlayer

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		play()
