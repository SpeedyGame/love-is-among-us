extends Node2D

var draggable = false
var is_inside_droppable = false
var body_ref
var offset: Vector2
var initialPos :Vector2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_droppable:
				tween.tween_property(self,"position",body_ref.position,0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self,"global_position",initialPos,0.2).set_ease(Tween.EASE_OUT)
func _on_area_2d_mouse_entered():
	if not Global.is.dragging:
		draggable = true
		scale = Vector2(1.05,1.05)


func _on_area_2d_body_entered(body):
	if body.is_in_group('dropable'):
		is_inside_droppable = true
		body.modulate = Color(Color.CRIMSON,1)
		body_ref = body


func _on_area_2d_mouse_exited():
	if not Global.is.dragging:
		draggable = false
		scale = Vector2(1,1)

func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_droppable = false
		body.modulate = Color(Color.RED, 0.7)
