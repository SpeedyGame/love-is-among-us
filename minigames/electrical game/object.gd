extends Node2D


var draggable = false
var body_ref
var line1 = null


# Called when the node enters the scene tree for the first time.
func _ready():
	draw_line(body_ref.position, get_node("/root/Electrical/Permanent").global_position, Color.BLACK)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			Electricalglobal.is_dragging = false


func _on_area_2d_mouse_entered():
	if not Electricalglobal.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)


func _on_area_2d_mouse_exited():
	if not Electricalglobal.is_dragging:
		draggable = false
		scale = Vector2(1,1)

