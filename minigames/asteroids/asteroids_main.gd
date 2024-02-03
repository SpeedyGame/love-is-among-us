extends Node2D

@export var asteroid : PackedScene
var score

func start_game():
	score = 0
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready...")
	
func game_over():
	$HUD.show_game_over()
	
func _on_start_timer_timeout():
	$AsteroidTimer.start()


func _on_asteroid_timer_timeout():
	var asteroid = asteroid.instantiate()
	
	var asteroid_spawn_location = $AsteroidPath/AsteroidSpawnLocation
	asteroid_spawn_location.progress_ratio = randf()
	# print(asteroid_spawn_location.progress_ratio)
	
	# print(asteroid_spawn_location.rotation)
	var direction = asteroid_spawn_location.rotation + PI / 2
	
	asteroid.position = asteroid_spawn_location.position
	
	direction += randf_range(-PI/3, PI/4)
	print(direction)
	if (direction < PI/2):
		direction = PI/2
	elif (direction > (4 * PI) / 3):
		direction = (4 * PI) / 3
		
	asteroid.rotation = direction
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	asteroid.linear_velocity = velocity.rotated(direction)
	
	add_child(asteroid)

func _on_area_2d_body_exited(asteroid):
	asteroid.queue_free()
