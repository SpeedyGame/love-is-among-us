extends Panel

var time: float = 0.0
var seconds: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	seconds = fmod(time, 30)
	$time.text = "%02d" % seconds

func stop():
		set_process(false)
