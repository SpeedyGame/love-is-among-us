extends Node2D

@export var asteroid : PackedScene
var score
var asteroid_count = 20

func start_game():
	score = 0
	$StartTimer.start()
	$HUD/ScoreLabel.show()
	$HUD/AsteroidsDestroyed.show()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready...")
	
func game_over():
	# asteroid.disconnect("destroyed", _on_asteroid_destroyed)
	$AsteroidTimer.stop()
	$HUD.show_game_over()
	
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
		
	asteroid.rotation = direction
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	asteroid.linear_velocity = velocity.rotated(direction)
	
	if (asteroid_count <= 0):
		game_over()
	else:
		add_child(asteroid)
		asteroid_count -= 1
		print(asteroid_count)
	
	
func _on_asteroid_destroyed():
	#print("destroy signal receieved")
	score += 1
	$HUD.update_score(score)
	#print(score)

func _on_area_2d_body_exited(asteroid):
	asteroid.queue_free()
