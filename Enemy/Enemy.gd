extends KinematicBody

onready var Enemy = preload("res://Enemy/Enemy.tscn")
onready var Maze = get_node("/root/Game/Maze")
var Player = null

func _ready():
	var locations = []
	for x in range(Maze.width-2):
		for z in range(Maze.height-2):
			locations.append(Vector3(((x+1) * Maze.tile)-1,0.1,((z+1) * Maze.tile)-1))
	locations.shuffle()
	

func _physics_process(_delta):
	if Player == null:
		Player = get_node_or_null("/root/Game/Player")
	if Player != null:
		look_at(Player.global_transform.origin, Vector3.UP)
	
	
	



func _on_Area_body_entered(body):
	if body.name == "Player":
		var sound = get_node_or_null("/root/Game/Robot")
		if sound != null:
			sound.playing = true


func _on_Kill_body_entered(body):
	if body.name == "Player":
		var _scene = get_tree().change_scene("res://UI/Lose.tscn")

func walk():
	if position.x > start_pos + walk_distance: 
		is_walk_to_right = false
