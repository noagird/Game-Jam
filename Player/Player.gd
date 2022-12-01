extends KinematicBody

onready var Camera = $Pivot/Camera
onready var daCheese = load("res://Key/cheese.gd")
onready var daDough = load("res://Key/loaf.gd")
onready var daSausage = load("res://Key/sausage.gd")
onready var daTomato = load("res://Key/tomato.gd")


var gravity = -30
var speed = 6
var max_speed = 8
var mouse_sensitivity = 0.002
var mouse_range = 1.2

<<<<<<< Updated upstream
var to_pickup = null
=======
var to_pickup = null #whether item is picked up or not
>>>>>>> Stashed changes

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$Pivot/Camera.current = true

var velocity = Vector2.ZERO

onready var rc = $Pivot/RayCast
onready var flash = $Pivot/Blaster/Flash
onready var Decal = preload("res://Player/Decal.tscn")

func get_input():
	var input_dir = Vector3()
	if Input.is_action_pressed("forward"):
		input_dir += -Camera.global_transform.basis.z
	if Input.is_action_pressed("back"):
		input_dir += Camera.global_transform.basis.z
	if Input.is_action_pressed("left"):
		input_dir += -Camera.global_transform.basis.x
	if Input.is_action_pressed("right"):
		input_dir += Camera.global_transform.basis.x
	input_dir = input_dir.normalized()
	if Input.is_action_pressed("pickup"):
		pickup()
	return input_dir
	
func pickup():
	var cheese = get_node_or_null("Maze/cheese")
	var dough = get_node_or_null("Maze/loaf")
	var sausage = get_node_or_null("Maze/sausage")
	var tomato = get_node_or_null("Maze/tomato")
	
	if cheese != null:
		pass
	if dough != null:
		pass
	if sausage != null:
		pass
	if tomato != null:
		pass
		
	if to_pickup != null:
		if to_pickup == cheese:
			cheese = to_pickup.Pickup.instance() #pick up cheese
			cheese.name = "cheese"
			daCheese.disappear()
			to_pickup.queue_free() #cheese disappears
			daCheese.queue_free()
			
			#add a function to the checklist on HUD
		
		if to_pickup == dough:
			dough = to_pickup.Pickup.instance()
			dough.name = "dough"
			daDough.disappear()
			to_pickup.queue_free()
			daCheese.queue_free()
			#add a function to the checklist on HUD
		
		if to_pickup == sausage:
			sausage = to_pickup.Pickup.instance()
			sausage.name = "sausage"
			daSausage.disappear()
			to_pickup.queue_free()
			daCheese.queue_free()
			#add a function to the checklist on HUD
		
		if to_pickup == tomato:
			tomato = to_pickup.Pickup.instance()
			tomato.name = "sausage"
			daTomato.disappear()
			to_pickup.queue_free()
			daCheese.queue_free()
			#add a function to the checklist on HUD

		to_pickup.queue_free()

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		$Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -mouse_range, mouse_range)

func _physics_process(delta):
	velocity = get_input()*speed
	velocity.y += gravity
	if is_on_floor():
		velocity.y = 0
	
	if velocity != Vector3.ZERO:
		velocity = move_and_slide(velocity,Vector3.UP)
		
	if Input.is_action_pressed("shoot"):
		shoot()
	
	if Input.is_action_pressed("pickup"):
		pickup()

func shoot():
	var gun = get_node_or_null("Player/Pivot/Blaster")
	if gun != null and gun.has_method("shoot"):
		gun.shoot();

func _on_sausage_body_entered(body):
	if body.is_in_group("Food"):
		to_pickup = body


func _on_loaf_body_entered(body):
	if body.is_in_group("Food"):
		to_pickup = body


func _on_cheese_body_entered(body):
	if body.is_in_group("Food"):
		to_pickup = body


func _on_tomato_body_entered(body):
	if body.is_in_group("Food"):
		to_pickup = body


func _on_sausage_body_exited(body):
	to_pickup = null


func _on_loaf_body_exited(body):
	to_pickup = null


func _on_cheese_body_exited(body):
	to_pickup = null


func _on_tomato_body_exited(body):
	to_pickup = null
