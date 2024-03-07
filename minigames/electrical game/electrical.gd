extends Node2D

var draggableObjects: Array = []
var nonDraggableObjects: Array = []
var connectionRadius: float = 100.0
var line: Line2D = null
var connectingObjects: Array = []

func _ready():
	# Connect signals to draggable objects
	for child in get_tree().get_nodes_in_group("draggable_objects"):
		var draggableObject: Node2D = cast(child, Node2D)
		draggableObject.connect("input_event", self, "_on_draggable_object_input_event")
		draggableObjects.append(draggableObject)

	# Connect signals to non-draggable objects
	for child in get_tree().get_nodes_in_group("non_draggable_objects"):
		var nonDraggableObject: Node2D = cast(child, Node2D)
		nonDraggableObject.connect("area_entered", self, "_on_non_draggable_object_area_entered")
		nonDraggableObject.connect("area_exited", self, "_on_non_draggable_object_area_exited")
		nonDraggableObjects.append(nonDraggableObject)

	# Add line for connections
	line = Line2D.new()
	add_child(line)

func _on_draggable_object_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		var draggableObject: Node2D = cast(viewport.get_node(shape_idx), Node2D)
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			# Start dragging the object
			draggableObject.grabbing = true
			draggableObject.global_grab_offset = draggableObject.position - viewport.get_mouse_position()
		elif event.button_index == BUTTON_LEFT and not event.is_pressed():
			# Stop dragging the object
			draggableObject.grabbing = false

func _on_non_draggable_object_area_entered(area: Area2D) -> void:
	if (area is Node2D) and (area !in connectingObjects):
		connectingObjects.append(area)

	if connectingObjects.size() >= 2:
		update_connections()

func _on_non_draggable_object_area_exited(area: Area2D) -> void:
	if area is Node2D and area in connectingObjects:
		connectingObjects.erase(connectingObjects.find(area))
		update_connections()

func _process(delta: float) -> void:
	# Update draggable objects position based on mouse movement
	for draggableObject in draggableObjects:
		if draggableObject.grabbing:
			draggableObject.position = get_viewport().get_mouse_position() + draggableObject.global_grab_offset

	# Update connections
	update_connections()

func update_connections() -> void:
	line.clear_points()

	if connectingObjects.size() >= 2:
		var draggablePosition = Vector2.ZERO
		for draggableObject in draggableObjects:
			if draggableObject.grabbing:
				draggablePosition = draggableObject.position
				break

		for nonDraggableObject in connectingObjects:
			line.add_point(nonDraggableObject.global_position)

		line.add_point(draggablePosition)
}
