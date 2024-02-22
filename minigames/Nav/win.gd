extends Area2D

var tile_size = 40
var empty = true
@export var transitioner : Transitioner
#var coins = get_tree().get_nodes_in_group("coin")
var score = 0
var curr_day : String


func _ready():
	curr_day = Dialogic.VAR.CurrentDay
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _unhandled_input(event):
	if !empty:
		print("level complete")
		back_to_timeline()
		#score = get_node("Coin").coins  #coins - get_tree().get_nodes_in_group("coin")
		

func _on_area_entered(area):
	back_to_timeline()
	empty = false
	
func back_to_timeline():
	transitioner.set_next_animation_timeline(true)




#func _on_area_2d_area_entered(area):
#	if !empty:
#		print("level complete") # Replace with function body.


func _on_timer_timeout():
	back_to_timeline()
