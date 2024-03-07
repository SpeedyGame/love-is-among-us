extends Node2D


var draggable = false
var body_ref
var holder = Line2D.new();

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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



func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	holder.add_point(area.position)


func _on_area_2d_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	holder.remove_point(area.position)
