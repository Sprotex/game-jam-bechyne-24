extends CharacterInput
class_name PlayerInput


func _handle_movement_input(_event: InputEvent) -> void:
	var vertical_axis = Input.get_axis("move_up", "move_down")
	var horizontal_axis = Input.get_axis("move_left", "move_right")
	var input_axes = Vector2(horizontal_axis, vertical_axis)
	if input_axes.length_squared() > 1.0:
		input_axes = input_axes.normalized()
	input_movement = input_axes


func _handle_attack_input(event: InputEvent) -> void:
	if not event.is_pressed():
		return
	if event.is_echo():
		return
	if event.is_action_pressed("light_attack"):
		on_light_attack_input.emit()
	if event.is_action_pressed("heavy_attack"):
		on_heavy_attack_input.emit()


func _unhandled_key_input(event: InputEvent) -> void:
	_handle_movement_input(event)
	_handle_attack_input(event)
