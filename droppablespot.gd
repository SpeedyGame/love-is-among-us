extends StaticBody2D

var isOccupied = false

func _ready():
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)

func _process(delta):
	if Global.is_dragging:
		visible = true
	else:
		visible = false
	
