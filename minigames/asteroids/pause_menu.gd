extends Node2D

#@export var pause_button : Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("pause") && get_tree().paused == false):
		#print("pause key has been pressed!")
		_on_pause_key_pressed()
		
	elif (Input.is_action_just_pressed("pause") && get_tree().paused == true):
		#print("pause key has been pressed!")
		_on_close_key_pressed()

func _on_pause_key_pressed():
	get_tree().paused = true
	show()
	#pause_button.set_toggle_mode(true)
	print("Paused.")
#
func _on_close_key_pressed():
	hide()
	get_tree().paused = false
	#pause_button.set_toggle_mode(false)
	print("Unpaused.")

func _on_pause_button_toggled(toggled_on):
	#print("pause was pressed")
	if (toggled_on == true):
		get_tree().paused = toggled_on
		show()
		#pause_button.set_toggle_mode(true)
		print("Paused.")
		
	if (toggled_on == false):
		hide()
		get_tree().paused = false
		#pause_button.set_toggle_mode(false)
		print("Unpaused.")
	print(str(toggled_on))
	#print("switch state")
