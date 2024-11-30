extends Node
class_name Movement

@export var input: PlayerInput
@export var body: CharacterBody2D
@export var move_speed := 1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	body.velocity = input.input_movement * move_speed
	body.move_and_slide()
