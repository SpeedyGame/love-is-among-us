extends Control

class_name PackedTransitioner

@export var scene_switch_anim : String = "fade_out"
@export var scene_to_load : PackedScene

@onready var animation_tex : TextureRect = $TextureRect
@onready var animation_player : AnimationPlayer =  $AnimationPlayer

var selected_task : String

#@onready var animation_tex = get_node("/root/Main/HUD/Transitioner/TextureRect")
#@onready var animation_player = get_node("/root/Main/HUD/Transitioner/AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_tex.visible = false
	
func set_next_animation(fading_out : bool):
	#if (Dialogic.VAR.Day1Task == str("Colonel")):
		#selected_task = "asteroids/asteroids_main"
	#elif (Dialogic.VAR.Day1Task == str("Tracker")):
		#selected_task = "Nav/navgame"
	#
	#scene_to_load = "res://minigames/" + selected_task + ".tscn"
	##print(scene_to_load)
	#print(Dialogic.VAR.Day1Task)
	
	if (fading_out):
		animation_player.queue("fade_out")
	else:
		animation_player.queue("fade_in")

func _on_animation_player_animation_finished(anim_name):
	#if(scene_to_load != null && anim_name == scene_switch_anim):
		#get_tree().change_scene_to_file(scene_to_load)
	if(scene_to_load != null && anim_name == scene_switch_anim):
		get_tree().change_scene_to_packed(scene_to_load)
