extends Node2D

#@export var transistioner : Transitioner

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("res://dialogic_assets/timelines/colonel_task1_2.dtl")
	#Dialogic.signal_event.connect(DialogicSignal)

#func DialogicSignal(argument:String):
	#if argument == "start_asteroids":
		#transistioner.set_next_animation(true)
		##print("Something was activated!")
