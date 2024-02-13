extends Node2D

var draggable = false
var is_inside_droppable = false
var body_ref


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_area_2d_mouse_entered():
	if not global.is.dragging:
		draggable = true
		scale = vector2(1.05,1.05)


func _on_area_2d_body_entered(body):
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	if not global.is.dragging:
		draggable = false
		scale = Vector2(1,1)



func _on_area_2d_body_exited(body):
	pass # Replace with function body.
