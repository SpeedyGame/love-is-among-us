extends CanvasLayer

signal start_game
# Called when the node enters the scene tree for the first time.
func _ready():
	$ScoreLabel.hide()
	$AsteroidsDestroyed.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	$Message.text = "Game Over"
	$Message.show()
	#show_message("Game Over")
	#await $MessageTimer.timeout
	
func update_score(score):
	$ScoreLabel.text = str(score)

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()
