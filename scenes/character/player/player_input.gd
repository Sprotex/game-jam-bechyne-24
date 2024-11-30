extends Node
class_name PlayerInput

var input_movement: Vector2

func _unhandled_key_input(event: InputEvent) -> void:
	var vertical_axis = Input.get_axis("move_up", "move_down")
	var horizontal_axis = Input.get_axis("move_left", "move_right")
	var input_axes = Vector2(horizontal_axis, vertical_axis)
	if input_axes.length_squared() > 1.0:
		input_axes = input_axes.normalized()
	input_movement = input_axes
