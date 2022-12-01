extends KinematicBody

onready var Camera = $Pivot/Camera

var gravity = -30
var max_speed = 8
var mouse_sensitivity = 0.002
var mouse_range = 1.2

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$Pivot/Camera.current = true
	randomize()

var velocity = Vector3()


onready var rc = $Pivot/RayCast
onready var Decal = preload("res://Player/Decal.tscn")
onready var audio_stream_array = [$FS_Carpet_01, $FS_Carpet_02, $FS_Carpet_03]

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
	return input_dir

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		$Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -mouse_range, mouse_range)

func _physics_process(delta):
	velocity.y += gravity * delta
	var desired_velocity = get_input() * max_speed
	
	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)
	
	if velocity.length() > 0:
		if $FS_Timer.time_left <= 0:
			var clip_to_play = audio_stream_array[randi() % audio_stream_array.size()]
			clip_to_play.pitch_scale = rand_range(0.8, 1.2)
			clip_to_play.play()
			$FS_Timer.start(0.29)
	
	if Input.is_action_just_pressed("shoot"):
		if rc.is_colliding():
			var c = rc.get_collider()
			#var decal = Decal.instance() 
			#rc.get_collider().add_child(decal)
			#decal.global_transform.origin = rc.get_collision_point()
			#decal.look_at(rc.get_collision_point() + rc.get_collision_normal(), Vector3.UP)
			if c.is_in_group("Enemy"):
				c.health -= 100  
				if c.health <= 0:
					c.queue_free()
