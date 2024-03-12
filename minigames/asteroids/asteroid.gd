extends RigidBody2D

@onready var _animated_sprite = $AnimatedSprite2D

signal destroyed
# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_sprite.play("default")
	pass

#func _on_visible_on_screen_notifier_2d_screen_exited():
	#queue_free()

func _on_clickable_pressed():
	#print("Destroyed asteroid")
	queue_free()
	destroyed.emit()
	
#func disable_button():
	#print("asteroid disabled")
	## $Clickable.disabled()
