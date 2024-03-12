extends Control

class_name Transitioner

@export var scene_switch_anim : String = "fade_out"
var scene_to_load : String

@onready var animation_tex : TextureRect = $TextureRect
@onready var animation_player : AnimationPlayer =  $AnimationPlayer

var selected_task : String
var selected_timeline : String

#@onready var animation_tex = get_node("/root/Main/HUD/Transitioner/TextureRect")
#@onready var animation_player = get_node("/root/Main/HUD/Transitioner/AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_tex.visible = false
	
func set_next_animation(fading_out : bool):
	if (Dialogic.VAR.Day1Task == str("Colonel") || Dialogic.VAR.Day2Task == str("Colonel")):
		selected_task = "asteroids/asteroids_main"
	elif (Dialogic.VAR.Day1Task == str("Tracker") || Dialogic.VAR.Day2Task == str("Tracker")):
		selected_task = "Nav/navgame"
	#elif (Dialogic.VAR.Day1Task == str("Spark") || Dialogic.VAR.Day2Task == str("Spark")):
		#selected_task = "electrical game/electrical"
	
	scene_to_load = "res://minigames/" + selected_task + ".tscn"
	#print(scene_to_load)
	print(Dialogic.VAR.Day2Task)
	print(selected_task)
	
	if (fading_out):
		animation_player.queue("fade_out")
	else:
		animation_player.queue("fade_in")

func set_next_animation_timeline(fading_out : bool):
	if (Dialogic.VAR.Day1Task == str("Colonel") || Dialogic.VAR.Day2Task == str("Colonel")):
		if (Dialogic.VAR.CurrentDay == str("Day1")):
			selected_timeline = "task_scenes/colonel_task_1"
		elif (Dialogic.VAR.CurrentDay == str("Day2")):
			selected_timeline = "task_scenes/colonel_task_2" #does not exist yet
			
	elif (Dialogic.VAR.Day1Task == str("Tracker") || Dialogic.VAR.Day2Task == str("Tracker")):
		if (Dialogic.VAR.CurrentDay == str("Day1")):
			selected_timeline = "task_scenes/trackertask1"
		elif (Dialogic.VAR.CurrentDay == str("Day2")):
			selected_timeline = "task_scenes/trackertask2" #does not exist yet
	
	scene_to_load = "res://scenes/" + selected_timeline + ".tscn"
	#print(scene_to_load)
	print(selected_timeline)
	
	if (fading_out):
		animation_player.queue("fade_out")
	else:
		animation_player.queue("fade_in")
		
func _on_animation_player_animation_finished(anim_name):
	if(scene_to_load != null && anim_name == scene_switch_anim):
		get_tree().change_scene_to_file(scene_to_load)
	#if(scene_to_load != null && anim_name == scene_switch_anim):
		#get_tree().change_scene_to_file(scene_to_load)
