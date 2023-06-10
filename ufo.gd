extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		apply_force(Vector2(input_force, 0))
	elif Input.is_action_pressed("move_left"):
		apply_force(Vector2(-input_force, 0))
	if Input.is_action_pressed("move_up"):
		apply_force(Vector2(0, -input_force))
	elif Input.is_action_pressed("move_down"):
		apply_force(Vector2(0, input_force))

	var velocity_sq = linear_velocity.length_squared()
	var velocity_scaler = max_velocity_sq / velocity_sq
	if velocity_scaler < 1:
		linear_velocity *= velocity_scaler

func _on_maze_body_exited(body:Node2D):
	position = start_position
	linear_velocity = Vector2(0,0)

var start_position: Vector2
@export var input_force: float = 80
@export var max_velocity_sq: float = 1000


