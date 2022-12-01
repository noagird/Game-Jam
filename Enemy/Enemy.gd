extends KinematicBody

<<<<<<< Updated upstream
<<<<<<< Updated upstream
onready var Enemy = preload("res://Enemy/Enemy.tscn")
onready var Maze = get_node("/root/Game/Maze")
var Player = null
=======
onready var Player = preload("res://Player/Player.tscn")

var velocity = Vector2()
var speed = 100
var detectedPlayer = false
var playerPosition = Vector2()
var enemyPosition = Vector2()
>>>>>>> Stashed changes

func _ready():
	var locations = []
	for x in range(Maze.width-2):
		for z in range(Maze.height-2):
			locations.append(Vector3(((x+1) * Maze.tile)-1,0.1,((z+1) * Maze.tile)-1))
	locations.shuffle()
=======
onready var Enemy = preload("res://Enemy/Enemy.tscn")
onready var Maze = get_node("/root/Game/Maze")
onready var Player = get_node("/root/Game/Player")

var velocity = Vector2()
var speed = 100
var detectedPlayer = false
var playerPosition = Vector2()
var enemyPosition = Vector2()

func _ready():
	var locations = []
	for x in range(Maze.width-2):
		for z in range(Maze.height-2):
			locations.append(Vector3(((x+1) * Maze.tile)-1,0.1,((z+1) * Maze.tile)-1))
	locations.shuffle()

func _physics_process(_delta):
	playerPosition = Player.global_position #error: invalid get index 'global_position' (on base: 'PackedScene')
	
	if detectedPlayer == false: #if player undetected, do nothing
		pass
			
	if detectedPlayer == true: #if player detected, follow them
		look_at(Player.global_transform.origin, Vector3.UP)
		var dir = (playerPosition - enemyPosition).normalized() #direction enemy is going to player
		move_and_collide(dir * speed * _delta) #moving speed
>>>>>>> Stashed changes
	

func _physics_process(_delta):
	playerPosition = Player.global_position #error: invalid get index 'global_position' (on base: 'PackedScene')
	
	if detectedPlayer == false: #if player undetected, do nothing
		pass
			
	if detectedPlayer == true: #if player detected, follow them
		look_at(Player.global_transform.origin, Vector3.UP)
		var dir = (playerPosition - enemyPosition).normalized() #direction enemy is going to player
		move_and_collide(dir * speed * _delta) #moving speed
		
	


func _on_Area_body_entered(body):
	if body.name == "Player":
		detectedPlayer = true #player found
		var sound = get_node_or_null("/root/Game/Robot")
		if sound != null:
			sound.playing = true


func _on_Kill_body_entered(body):
	if body.name == "Player":
		var _scene = get_tree().change_scene("res://UI/Lose.tscn")

func walk():
	if position.x > start_pos + walk_distance: 
		is_walk_to_right = false
