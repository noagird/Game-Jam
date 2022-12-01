extends AudioStreamPlayer


func _ready():
	pitch_scale = Global.pickup_pitch

func _on_sausage_body_entered(_body):
	play()
	Global.pickup_pitch += 0.25
	pitch_scale = Global.pickup_pitch

func _on_loaf_body_entered(_body):
	play()
	Global.pickup_pitch += 0.25
	pitch_scale = Global.pickup_pitch

func _on_cheese_body_entered(_body):
	play()
	Global.pickup_pitch += 0.25
	pitch_scale = Global.pickup_pitch

func _on_tomato_body_entered(_body):
	play()
	Global.pickup_pitch += 0.25
	pitch_scale = Global.pickup_pitch
