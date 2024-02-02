extends Node2D

@export var opening_scene : PackedScene
@export var transistioner : Transitioner

@onready var audio_control : AnimationPlayer =  $TitleScreenMusic/AudioFade
@onready var music_player : AudioStreamPlayer2D =  $TitleScreenMusic 	# $ is the name of the node.

# Called when the node enters the scene tree for the first time.
func _ready():
	music_player.play(0.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	transistioner.set_next_animation(true)
	audio_control.queue("fade_out_music")
	# get_tree().change_scene_to_packed(opening_scene)
