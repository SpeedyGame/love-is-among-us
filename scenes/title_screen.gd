extends Node2D

@export var opening_scene : PackedScene
@export var transistioner : Transitioner

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	transistioner.set_next_animation(true)
	# get_tree().change_scene_to_packed(opening_scene)
