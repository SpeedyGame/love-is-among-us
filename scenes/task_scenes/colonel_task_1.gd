extends Node2D

@export var ptransistioner : PackedTransitioner

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("res://dialogic_assets/timelines/colonel_task1_2.dtl")
	Dialogic.signal_event.connect(DialogicSignal)

func DialogicSignal(argument:String):
	if argument == "day1_end":
		ptransistioner.set_next_animation(true)
		print("Something was activated!")
	#if argument == "test":
		#print("test test")
