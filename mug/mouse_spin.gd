extends Node3D

var active := false
var rotation_speed := 0.085 # start animation
var previous_mouse_position := Vector2.ZERO

func _process(delta: float):
	if Input.is_action_just_pressed("left_click"):
		# Start tracking
		previous_mouse_position = get_viewport().get_mouse_position()
	elif Input.is_action_pressed("left_click"):
		# Difference since last frame -> speed
		var mouse_position := get_viewport().get_mouse_position() 
		rotation_speed = (mouse_position.x - previous_mouse_position.x) / 400
		previous_mouse_position = mouse_position
	if rotation_speed:
		# Rotate and damp speed
		rotation.y += rotation_speed
		rotation_speed = lerpf(rotation_speed, 0.0, 1.5 * delta)
