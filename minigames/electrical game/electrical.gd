extends Node2D

var holder = Line2D.new()
var draggableObjects: Array = []
var nonDraggableObjects: Array = []
var connectedObjects = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if connectedObjects.size() == 5:
		#win
