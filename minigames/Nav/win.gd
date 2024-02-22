extends Area2D

var tile_size = 40
var empty = true


func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _unhandled_input(event):
	if !empty:
		print("level complete")
		#back_to_timeline()

func _on_area_entered(area):
	empty = false




#func _on_area_2d_area_entered(area):
#	if !empty:
#		print("level complete") # Replace with function body.
