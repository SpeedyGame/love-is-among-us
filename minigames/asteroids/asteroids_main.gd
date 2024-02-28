extends Node2D

@export var asteroid : PackedScene
@export var transitioner : Transitioner
#@export var ptransitioner : PackedTransitioner

var score : int
var asteroid_count : int = 50
var curr_day : String
@onready var asteroid_sfx_player: AudioStreamPlayer2D = $AsteroidSFXPlayer

func start_game():
	#game_over()
	#print(Dialogic.VAR.Day1TaskWellness)
	#print(Dialogic.VAR.Day2TaskWellness)
	curr_day = Dialogic.VAR.CurrentDay
	print(curr_day)
	score = 0
	$StartTimer.start()
	$HUD/ScoreLabel.show()
	$HUD/AsteroidsDestroyed.show()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready...")
	
func game_over():
	# asteroid.disconnect("destroyed", _on_asteroid_destroyed)
	acc_calc()
	#print(Dialogic.VAR.Day1TaskWellness)
	#print(Dialogic.VAR.Day2TaskWellness)
	$AsteroidTimer.stop()
	$HUD.show_game_over()
	await get_tree().create_timer(3.0).timeout
	back_to_timeline()
	
func _on_start_timer_timeout():
	$AsteroidTimer.start()
	
func _on_asteroid_timer_timeout():
	var asteroid = asteroid.instantiate()
	asteroid.destroyed.connect(_on_asteroid_destroyed) #connects destroyed signal from asteroid to func
	
	var asteroid_spawn_location = $AsteroidPath/AsteroidSpawnLocation
	asteroid_spawn_location.progress_ratio = randf()
	print("location: " + str(asteroid_spawn_location.progress_ratio))
	
	#print(asteroid_spawn_location.rotation)
	var direction = asteroid_spawn_location.rotation + PI / 2
	
	asteroid.position = asteroid_spawn_location.position
	
	direction += randf_range(-PI/4, PI/4)
	print(str(direction) + "\n")
	#if (direction < PI/2):
		#direction = PI/2
	#elif (direction > (4 * PI) / 3):
		#direction = (4 * PI) / 3
	if (asteroid_spawn_location.progress_ratio > 0.9):
		direction = PI/4
	#elif (asteroid_spawn_location.progress_ratio < 0.15):
		#direction = PI/4
	#elif (asteroid_spawn_location.progress_ratio < 0.4):
		#direction = PI/4
	#elif (asteroid_spawn_location.progress_ratio < 0.65):
		#direction = PI/4
		
	asteroid.rotation = direction
	
	var velocity = Vector2(randf_range(225.0, 400.0), 0.0)
	asteroid.linear_velocity = velocity.rotated(direction)
	
	if (asteroid_count <= 0):
		asteroid_count = 20
		game_over()
	else:
		get_tree().root.add_child(asteroid)
		asteroid_count -= 1
		#print(asteroid_count)
	
func _on_asteroid_destroyed():
	#print("destroy signal receieved")
	score += 1
	$HUD.update_score(score)
	asteroid_sfx_player.play(0.0)
	#print(score)

func _on_area_2d_body_exited(body):
	#print("remove asteroid")
	body.queue_free()

func back_to_timeline():
	transitioner.set_next_animation_timeline(true)
	#ptransitioner.set_next_animation(true)
	
func acc_calc():
	print((float(score) / asteroid_count) * 100.0)
	if ((float(score) / asteroid_count) * 100 >= 75):
		if (curr_day == "Day1"):
			Dialogic.VAR.Day1TaskWellness = str("True")
		elif (curr_day == "Day2"):
			Dialogic.VAR.Day2TaskWellness = str("True")
