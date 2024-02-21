extends Node2D

var dot2 = preload("res://minigames/electrical/first dot.gd")
# Called when the node enters the scene tree for the first time.
var draggable1 = false
var is_inside_droppable1 = false
var body_ref1
var offset1: Vector2
var initialPos1 : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable1:
		if Input.is_action_pressed('click'):
			initialPos1 = global_position
			offset1 = get_global_mouse_position() - global_position
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released('click'):
			Global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_droppable1:
				tween.tween_property(self,'position',body_ref1.position, 0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self,'global_position',initialPos1, 0.2).set_ease(Tween.EASE_OUT)


func _on_area_2d_body_entered(body):
	if body.is_in_group('dropable'):
		is_inside_droppable1 = true
		body.modulate = Color(Color.CRIMSON,1)
		body_ref1 = body

func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_droppable1 = false
		body.modulate = Color(Color.CRIMSON, 0.7) 

func _on_area_2d_mouse_entered():
	if not Global.is_dragging:
		draggable1 = true
		scale = Vector2(1.05,1.05)



func _on_area_2d_mouse_exited():
	if not Global.is_dragging:
		draggable1 = false
		scale = Vector2(1,1)
