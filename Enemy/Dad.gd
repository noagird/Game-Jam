extends KinematicBody

var health = 300

func _ready():
	$AnimationPlayer.play("Walk")
