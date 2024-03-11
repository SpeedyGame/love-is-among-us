extends Area2D

var curr_day : String
var inside = 0
@export var transitioner : Transitioner
# Called when the node enters the scene tree for the first time.
func _ready():
	curr_day = Dialogic.VAR.CurrentDay



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_area_entered(area):
	inside +=1
	if inside == 2:
		back_to_timeline()


func _on_area_exited(area):
	if inside == 1:
		inside-=1

func _on_timer_timeout():
	back_to_timeline()


func back_to_timeline():
	Dialogic.VAR.Day1TaskWellness = str("True")
	transitioner.set_next_animation_timeline(true)
