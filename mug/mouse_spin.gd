extends Node3D

var active := false
func _process(_delta):
	if active:
		var mouse_position := get_viewport().get_mouse_position()
		print(mouse_position)
		rotation.y = mouse_position.x / 400
