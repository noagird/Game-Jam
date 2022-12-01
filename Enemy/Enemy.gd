extends KinematicBody


var health = 300
onready var Player = get_node_or_null("/root/Game/Player")

var velocity = Vector2()
var speed = 100
var detectedPlayer = false
var playerPosition = Vector3()
var enemyPosition = Vector3()


func _physics_process(_delta):
	playerPosition = Player.global_transform.origin #error: invalid get index 'global_position' (on base: 'PackedScene')

	if detectedPlayer == false: #if player undetected, do nothing
		pass

	if detectedPlayer == true: #if player detected, follow them
		look_at(Player.global_transform.origin, Vector3.UP)
		var dir = (playerPosition - enemyPosition).normalized() #direction enemy is going to player
		move_and_collide(dir * -speed * _delta) #moving speed
	



func _on_Area_body_entered(body):
	if body.name == "Player":
		detectedPlayer = true
		var sound = get_node_or_null("/root/Game/Robot")
		if sound != null:
			sound.playing = true



func _on_Kill_body_entered(body):
	if body.name == "Player":
		var _scene = get_tree().change_scene("res://UI/Lose.tscn")
