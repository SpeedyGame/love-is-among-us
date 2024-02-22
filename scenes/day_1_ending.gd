extends Node2D

#@export var transistioner : Transitioner
@export var ptransistioner : PackedTransitioner

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("res://dialogic_assets/timelines/day1_end.dtl")
	Dialogic.signal_event.connect(DialogicSignal)

func DialogicSignal(argument:String):
	if argument == "day2":
		ptransistioner.set_next_animation(true)
		print("Something was activated!")
