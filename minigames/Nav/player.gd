extends Area2D

var tile_size = 40
var inputs = {"right": Vector2.RIGHT, "left": Vector2.LEFT, "up": Vector2.UP, "down": Vector2.DOWN}

@onready var ray = $RayCast2D
# Called when the node enters the scene tree for the first time.
func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2



func _physics_process(delta):
	if Input.is_action_pressed("right"):
		move("right")
	elif Input.is_action_pressed("left"):
		move("left")
	elif Input.is_action_pressed("up"):
		move("up")
	elif Input.is_action_pressed("down"):
		move("down")

func move(dir):
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += inputs[dir] * tile_size


