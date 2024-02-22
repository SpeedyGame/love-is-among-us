extends Node2D

@export var asteroid : PackedScene
@export var transitioner : Transitioner

var score
var asteroid_count = 20
@onready var asteroid_sfx_player: AudioStreamPlayer2D = $AsteroidSFXPlayer

func start_game():
	#game_over()
	print(Dialogic.VAR.Day1TaskWellness)
	score = 0
	$StartTimer.start()
	$HUD/ScoreLabel.show()
	$HUD/AsteroidsDestroyed.show()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready...")
	
func game_over():
	# asteroid.disconnect("destroyed", _on_asteroid_destroyed)
	acc_calc()
	print(Dialogic.VAR.Day1TaskWellness)
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
	# print(asteroid_spawn_location.progress_ratio)
	
	# print(asteroid_spawn_location.rotation)
	var direction = asteroid_spawn_location.rotation + PI / 2
	
	asteroid.position = asteroid_spawn_location.position
	
	direction += randf_range(-PI/3, PI/4)
	# print(direction)
	if (direction < PI/2):
		direction = PI/2
	elif (direction > (4 * PI) / 3):
		direction = (4 * PI) / 3
	elif (asteroid_spawn_location.progress_ratio > 0.75):
		direction = (4 * PI) / 3
	elif (asteroid_spawn_location.progress_ratio < 0.1):
		direction = PI/4
		
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
	transitioner.set_next_animation(true)
	
func acc_calc():
	if ((score / asteroid_count) * 100 >= 75):
		Dialogic.VAR.Day1TaskWellness = str("True")
