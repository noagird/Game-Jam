extends Spatial

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		rotation_degrees.x = -20
		$Timer2.start()

func _on_Timer2_timeout():
	rotation_degrees.x = 0

